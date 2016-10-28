module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart
      if session[:user_id]
        @cart = Cart.find_by(user_id: session[:user_id])
      else
        @cart = Cart.find(session[:cart_id])
      end
      rescue
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
end
