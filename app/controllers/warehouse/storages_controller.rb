module Warehouse
  class StoragesController < ApplicationController
    layout 'warehouse'

    def index
      @orders = Order.order(created_at: :desc)
    end

    def show 
      @order = Order.find(params[:id])
    end
    
  end
end
