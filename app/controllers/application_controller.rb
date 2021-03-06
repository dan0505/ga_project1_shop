class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_cart 

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  # use method in view too
  helper_method :current_cart

  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
  helper_method :current_user

  private

  def cart_token
    # return cart_token unless it's nil
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end

end
