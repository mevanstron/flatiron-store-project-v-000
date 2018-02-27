class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout]
  def show
  end

  def checkout
    @cart.update(status: "Submitted")
    Item.update_inventory(@cart.line_items)

    current_user.update(current_cart: nil)
    redirect_to cart_path(@cart)
  end

  private

  def set_cart
    @cart = Cart.find_by(id: params[:id])
  end
end
