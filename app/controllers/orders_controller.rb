class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @cart = current_cart
    @products = @cart.cart_items.map { |item| { name: item.part.name, description: item.part.description, weight: item.part.weight, quantity: item.quantity } }
    @total_weight = calculate_total_weight
  end

  def create
    @order = Order.new(order_params.except(:order_lists_attributes)) 
    @order.user = current_user
    @order.status = "pending"
    @cart = current_cart
    @products = @cart.cart_items.map { |item| { name: item.part.name, description: item.part.description, weight: item.part.weight, quantity: item.quantity } }
    @total_weight = calculate_total_weight

    if @order.save
      @cart.cart_items.each do |cart_item|
        @order.order_lists.create(
          part_id: cart_item.part_id,
          quantity: cart_item.quantity,
          description: cart_item.part.description,
          weight: cart_item.part.weight
        )
      end
     
      @order = Order.includes(:order_lists, :parts).find(@order.id)

       OrderMailer.order_confirmation(@order).deliver_now
      @cart.destroy
      session[:cart_id] = nil
      redirect_to order_path(@order)
    else
      render :new
    end
  end
  

  def show
    @order = Order.find(params[:id])
  end

  def get_full_address
   
    site = Site.find_by(name: params[:site])

    if site
      render json: { full_address: site.address }
    else
      render json: { full_address: "address not found" }, status: :not_found
    end
  end

  def complete
    @order = Order.find(params[:id])
    if @order.in_progress? && delivery_quantities_present?
      @order.completed!
      redirect_to request.referer || warehouse_storages_path, notice: "Order set to Completed"
    else
      redirect_to request.referer || warehouse_storages_path, alert: "Check order(quantity) and save it first"
    end
  end

  def set_to_missing_parts
    @order = Order.find(params[:id])
    if @order.in_progress? && delivery_quantities_present?
      
      @order.missing_parts!
      redirect_to request.referer || warehouse_storages_path, notice: "Order set to Missing Parts"
    else
      redirect_to request.referer || warehouse_storages_path, alert: "Check order(quantity) and save it first"
    end
  end

  def delivery_quantities_present?
    @order.order_lists.all? { |order_list| order_list.delivery_quantity.present? }  
  end

  def in_progress?
    status == 'in_progress'
  end
  

  def set_to_pending
    @order = Order.find(params[:id])
    @order.pending!
    redirect_to request.referer || warehouse_storages_path, notice: "Order set to Pending"
  end

  def set_to_hide
    order = Order.find(params[:id])
    order.set_to_hide
    redirect_to request.referer || warehouse_storages_path, notice: 'Order has been hidden.' 
  end

  def set_to_visible
    order = Order.find(params[:id])
    order.set_to_visible
    redirect_to request.referer || warehouse_storages_path, notice: 'Order is visible.' 
  end

  def add_part
    @order = Order.find(params[:id])
    
    if params[:system_id].present?
      @selected_system = System.find(params[:system_id])
    else
    
    end
    
    @selected_category = Category.find(params[:category_id]) if params[:category_id].present?
  
    if params[:part_id].blank?
      redirect_to request.referrer || warehouse_storage_path(@order), alert: "Please select a part."
      return
    end
  
    @part = Part.find(params[:part_id])
    order_storage_list = OrderStorageList.find_or_initialize_by(order: @order, part: @part)
    
   
    if order_storage_list.persisted?
      order_storage_list.quantity += params[:quantity].to_i
    else
      order_storage_list.quantity = params[:quantity]
      order_storage_list.description = @part.description
      order_storage_list.weight = @part.weight
    end
    
    order_storage_list.save
    redirect_to request.referrer || warehouse_storage_path(@order), notice: "Part added successfully."
  end
  
  def delete_part
    @order = Order.find(params[:id])
    order_storage_list = OrderStorageList.find(params[:order_storage_list_id])
  
    if order_storage_list.order_id == @order.id
      order_storage_list.destroy
      redirect_to warehouse_storage_path(@order), notice: 'Successfully removed.'
    else
      redirect_to warehouse_storage_path(@order), alert: 'An error occurred while trying to remove the part.'
    end
  end
  

  private
  def order_params
    params.require(:order).permit(:building_site, :delivery_date, :info, :building_site_info, :new_delivery_date, :car_number, :status, :storage_info, :checkbox, :send_email, order_lists_attributes: [:part_id, :quantity, :description, :delivery_quantity, :checkbox])  end

  def calculate_total_weight
    @cart.cart_items.sum { |item| item.part.weight * item.quantity }
  end

end
  
