class PagesController < ApplicationController
  before_action :set_cart
  before_action :set_view_mode

  def index
    if params[:system].present?
      system = System.find_by(name: params[:system])
      @parts = system ? system.parts : Part.none
    end

    if params[:category].present? && @parts
      category = Category.find_by(name: params[:category])
      @parts = @parts.joins(:categories).where(categories: {id: category.id}) if category
    end

    if params[:description].present? && @parts
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

  def set_view_mode
    if params[:view_mode].present?
      session[:view_mode] = params[:view_mode]
    end
    @view_mode = session[:view_mode] || 'mobile'
  end
end
