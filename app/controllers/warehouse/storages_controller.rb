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

      @orders = filtered_orders(recent_orders.order(created_at: :desc))

      if start_date && end_date
        start_date = start_date.to_date.beginning_of_day
        end_date = end_date.to_date.end_of_day
        @orders = filtered_orders(@orders.where(created_at: start_date..end_date))
        @all_orders_view = true
        flash[:notice] = "Date selected"
      end
        
      if site_id
        site = Site.find(site_id)
        @orders = filtered_orders(@orders.where(building_site: site.name))
        @site_name = site.name
      end
      @orders = @orders.limit(100) unless @all_orders_view
    end

    def show 
      @order = Order.find(params[:id])
      
      if params[:system].present? && !params[:system].empty?
        system = System.find_by("LOWER(name) = ?", params[:system].downcase)
        @categories = system ? system.categories : Category.none
      else
        @categories = Category.none
      end
      

      if params[:category].present? && params[:category] != "Select category"
        category = Category.find_by("LOWER(name) = ?", params[:category].downcase)
        @parts = category ? category.parts.order(description: :asc) : Part.none
      else
        @parts = Part.none
      end
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

    def parts_on_site
      if params[:site_id]
        @site = Site.find(params[:site_id])
        @parts = {}
  
        orders = Order.where(building_site: @site.name).where(status: ['completed', 'missing_parts'])
        orders.each do |order|
          order.order_lists.each do |order_list|
            part = order_list.part
            ordered_quantity = order_list.quantity
            delivered_quantity = order_list.delivery_quantity || 0
            @parts[part] ||= { ordered: 0, delivered: 0 }
            @parts[part][:ordered] += ordered_quantity
            @parts[part][:delivered] += delivered_quantity
          end
        end
      end
    end


    def search_orders
      site_id = params[:site].presence
      if site_id
        site = Site.find(site_id)
        @orders = filtered_orders(Order.where(building_site: site.name))
        @site_name = site.name # Assigning the site name
      end
      render :index
    end
    
    
    
    
    def all_orders
      
      @orders = filtered_orders(Order.order(created_at: :desc))
      @all_orders_view = true
      render :index
    end
    
    def completed_orders
      
      @orders = filtered_orders(Order.where(status: 'completed').order(created_at: :desc).limit(100))
      @status = 'completed'
      render :index
    end

    def pending_orders
      @orders = filtered_orders(Order.where(status: 'pending').order(created_at: :desc).limit(100))
      @status = 'pending'
      render :index
    end

    def in_progress_orders
      @orders = filtered_orders(Order.where(status: 'in_progress').order(created_at: :desc).limit(100))
      @status = 'in progress'
      render :index
    end
    
    def missing_parts_orders
      @orders = filtered_orders(Order.where(status: 'missing_parts').order(created_at: :desc).limit(100))
      @status = 'missing parts'
      render :index
    end
  

    def hidden_orders
      @orders = Order.where(hidden: true).order(created_at: :desc)
      render :index
    end
    
    def print
     
      @order = Order.find(params[:id])
      render pdf: "order_#{@order.id}", template: 'warehouse/storages/print',
      margin: { top: 10, bottom: 10, left: 15, right: 15 }
    end
    
    
    private

    def filtered_orders(base_query)
      if params[:show_hidden] == "true"
        base_query
      else
        base_query.where(hidden: false)
      end
    end

    def recent_orders
      two_months_ago = 2.months.ago
      Order.where('created_at > ?', two_months_ago)
    end

    def order_params
      params.require(:order).permit(:new_delivery_date, :car_number, :storage_info, :hidden, order_lists_attributes: [:id, :delivery_quantity, :checkbox])
    end
  end
end
