class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_cart
  

  def current_cart
    if session[:cart_id]
      Cart.find(session[:cart_id])
    else
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end

end
