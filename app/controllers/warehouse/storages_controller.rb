module Warehouse
  class StoragesController < ApplicationController
    
    layout 'warehouse'
   

    def index
      @all_orders_view = false
      start_date = params[:start_date].presence
      end_date = params[:end_date].presence
      site_id = params[:site].presence
      @start_date = params[:start_date]
      @end_date = params[:end_date]

      @orders = recent_orders.order(created_at: :desc)

      if start_date && end_date
        start_date = start_date.to_date.beginning_of_day
        end_date = end_date.to_date.end_of_day
        @orders = @orders.where(created_at: start_date..end_date)
        @all_orders_view = true
        flash[:notice] = "Date selected"
      end
        
      if site_id
        site = Site.find(site_id)
        @orders = @orders.where(building_site: site.name)
        @site_name = site.name
      end
        
      @orders = @orders.limit(100) unless @all_orders_view
      
    end

    def show 
      @order = Order.find(params[:id])
    end
    
    def update
      @order = Order.find(params[:id])
      if @order.update(order_params)
       @order.in_progress!
        redirect_to warehouse_storages_path, notice: "Remember to accept order as completed"

      else
        render :show, alert: "Something goes wrong"
      end
    end

    def search_orders
      site_id = params[:site].presence
      if site_id
        site = Site.find(site_id)
        @orders = Order.where(building_site: site.name)
        @site_name = site.name # Assigning the site name
      end
      render :index
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
    
    def missing_parts_orders
      @orders = Order.where(status: 'missing_parts').order(created_at: :desc).limit(100)
      @status = 'missing parts'
      render :index
    end
  

    private

   

    def recent_orders
      six_months_ago = 6.months.ago
      Order.where('created_at > ?', six_months_ago)
    end

    def order_params
      params.require(:order).permit(:new_delivery_date, :car_number, :storage_info, order_lists_attributes: [:id, :delivery_quantity, :checkbox])
    end
  end
end
