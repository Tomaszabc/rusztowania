class PagesController < ApplicationController
  before_action :set_cart

  def index
    @parts = Part.all
    @parts = @parts.where(system: params[:system]) if params[:system]
    @parts = @parts.where(category: params[:category]).order(created_at: :asc) if params[:category]
    @part = Part.find_by(description: params[:description], category: params[:category], system: params[:system]) if params[:description]
  end

  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id])
    unless @cart
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end