class OrdersController < ApplicationController

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
    @cart = current_cart
  
    if @order.save
      @cart.cart_items.each do |cart_item|
        @order.order_lists.create(
          part_id: cart_item.part_id,
          quantity: cart_item.quantity,
          description: cart_item.part.description,
          weight: cart_item.part.weight
        )
      end
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

  private
  def order_params
    params.require(:order).permit(:building_site, :delivery_date, :info, :quantity, :name, :description, :weight)
  end

  def calculate_total_weight
    @cart.cart_items.sum { |item| item.part.weight * item.quantity }
  end

end
  
