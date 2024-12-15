# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :auto_login_admin
  before_action :auto_login
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

  private

  def auto_login_admin
    admin_user = AdminUser.find_by(email: 'admin@example.com')
    sign_in(admin_user, scope: :admin_user) if admin_user && !admin_user_signed_in?
  end

  def auto_login
    admin = User.find_by(email: 'admin@example.com')
    sign_in(admin) unless current_user
  end
end

# class ApplicationController < ActionController::Base
# before_action :authenticate_user!
# helper_method :current_cart

# def current_cart
#   if session[:cart_id]
#     Cart.find(session[:cart_id])
#   else
#     cart = Cart.create
#     session[:cart_id] = cart.id
#     cart
#   end
# end
# end
