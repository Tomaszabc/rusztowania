class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
    @cart_items = @cart.cart_items.includes(:part)
    @total_weight= calculate_total_weight
  end

  def clear_cart
    @cart = Cart.find(params[:id])
    @cart.cart_items.destroy_all
    redirect_to @cart, notice: 'Cart deleted !'
  end

  private

  def calculate_total_weight
    total_weight = 0
    @cart_items.each do |cart_item|
      total_weight += cart_item.part.weight * cart_item.quantity
    end
    total_weight
  end
end
