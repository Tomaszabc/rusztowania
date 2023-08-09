module Tracking
  class OrdersController < ApplicationController
    layout "tracking"

    def index
      @all_orders_view = false
      start_date = params[:start_date].presence
      end_date = params[:end_date].presence
      @start_date = params[:start_date]
      @end_date = params[:end_date]

      if start_date && end_date
        start_date = start_date.to_date.beginning_of_day
        end_date = end_date.to_date.end_of_day
        @orders = recent_orders.where(created_at: start_date..end_date).order(created_at: :desc)
        @all_orders_view = true
        flash[:notice] = "Date selected"
      else
        @orders = recent_orders.order(created_at: :desc).limit(100)
        @all_orders_view = false
        
      end
    end

    
    def show 
      @order = Order.find(params[:id])
    end

    
    def all_orders
      @orders = Order.order(created_at: :desc)
      @all_orders_view = true
      render :index
    end
    
    def completed_orders
      @orders = Order.where(status: 'completed').order(created_at: :desc).limit(100)
      @status = 'completed'
      render :index
    end

    def pending_orders
      @orders = Order.where(status: 'pending').order(created_at: :desc).limit(100)
      @status = 'pending'
      render :index
    end

    def in_progress_orders
      @orders = Order.where(status: 'in_progress').order(created_at: :desc).limit(100)
      @status = 'in progress'
      render :index
    end
    
 
  

    private

   

    def recent_orders
      six_months_ago = 6.months.ago
      Order.where('created_at > ?', six_months_ago)
    end

    def order_params
      params.require(:order).permit(:delivery_date, :new_delivery_date, :car_number, :storage_info, order_lists_attributes: [:id, :delivery_quantity, :checkbox])
    end


  end
end
