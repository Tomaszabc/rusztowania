module Warehouse
  class StoragesController < ApplicationController
    layout 'warehouse'

    def index
      @orders = Order.order(created_at: :desc)
    end

    def show 
      @order = Order.find(params[:id])
    end
    
    def update
      @order = Order.find(params[:id])
      if @order.update(order_params)
       
        redirect_to warehouse_storages_path, notice: "Order completed"

      else
        render :show, alert: "Something goes wrong"
      end
    end

    private

    def order_params
      params.require(:order).permit(:new_delivery_date, :car_number, order_lists_attributes: [:id, :delivery_quantity])
    end
  end
end
