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
    @order = Order.new(order_params)
    @order.user = current_user
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
    # Pobierz pełny adres na podstawie przekazanego "site" z parametrów zapytania.
    # Załóżmy, że masz model Site i atrybut "address" przechowujący pełny adres.
    site = Site.find_by(name: params[:site])

    if site
      render json: { full_address: site.address }
    else
      render json: { full_address: "address not found" }, status: :not_found
    end
  end

  private
  def order_params
    params.require(:order).permit(:building_site, :delivery_date, :info, :quantity, :name, :description, :weight, :user_id_eq, :car_number, :user_id, order_lists_attributes: [:part_id, :quantity, :description])
  end

  def calculate_total_weight
    @cart.cart_items.sum { |item| item.part.weight * item.quantity }
  end

end
  
