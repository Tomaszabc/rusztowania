# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    @cart = current_cart
    @existing_cart_item = @cart.cart_items.find_by(part_id: params[:cart_item][:part_id])

    if @existing_cart_item
      @existing_cart_item.quantity += params[:cart_item][:quantity].to_i
      if @existing_cart_item.save
        redirect_to request.referrer || root_path
        flash[:notice] = 'More parts added'
      else
        redirect_back(fallback_location: root_path, alert: 'Something went wrong')
      end
    else
      @cart_item = @cart.cart_items.build(cart_item_params)
      if @cart_item.save
        flash[:notice] = 'Successfully added'
        redirect_to request.referrer || root_path
      else
        redirect_back(fallback_location: root_path, alert: 'Something went wrong')
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])

    if @cart_item.update(cart_item_params)
      redirect_to cart_path(@cart_item.cart), notice: 'Quantity updated'
    else
      redirect_back(fallback_location: root_path, alert: 'Something went wrong')
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    redirect_to request.referrer || root_path, notice: 'Item deleted'
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:part_id, :quantity)
  end
end
