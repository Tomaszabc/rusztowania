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
       @order.in_progress!
        redirect_to warehouse_storages_path, notice: "Accept order as Completed"

      else
        render :show, alert: "Something goes wrong"
      end
    end

    def completed_orders
      @orders = Order.where(status: 'completed').order(created_at: :desc)
      @status = 'completed'
      render :index
    end

    def pending_orders
      @orders = Order.where(status: 'pending').order(created_at: :desc)
      @status = 'pending'
      render :index
    end

    def in_progress_orders
      @orders = Order.where(status: 'in_progress').order(created_at: :desc)
      @status = 'in progress'
      render :index
    end
    


    private

    def order_params
      params.require(:order).permit(:new_delivery_date, :car_number, order_lists_attributes: [:id, :delivery_quantity])
    end
  end
end
