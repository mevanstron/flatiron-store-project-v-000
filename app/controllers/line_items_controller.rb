class LineItemsController < ApplicationController

  def create
    current_user.update(current_cart: Cart.create) unless user_cart
    user_cart.add_item(params[:item_id]).save

    redirect_to cart_path(user_cart)
  end

  private

  def user_cart
    current_user.current_cart
  end
end
