class PagesController < ApplicationController
  before_action :set_cart

  def index
   if params[:system].present?
    system = System.find_by(name: params[:system])
    @parts = system ? system.parts : Part.none
   end

   if params[:category].present?
    category = Category.find_by(name: params[:category])
    @parts = category ? category.parts : Part.none
   end

   if params[:description].present?
    @part = Part.find_by(description: params[:description])
   end
   
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