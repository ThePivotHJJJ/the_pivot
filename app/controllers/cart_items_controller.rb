class CartItemsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] =
      "You added #{pluralize(@cart.cart_items.first.quantity, 'item')} to your cart"
    redirect_to items_path
  end

  def show
    ids = session[:cart]
    @cart_items = @cart.cart_items
  end

  def destroy
    item = find_item
    @cart.remove_item(item.id)
    flash[:success] = "Successfully removed item from cart"
    if @cart.contents.empty?
      redirect_to items_path
    else
      redirect_to cart_path
    end
  end

  def update
    item = find_item
    quantity = params[params[:id]].values.first.to_i
    @cart.contents[params[:id]] = quantity
    redirect_to cart_path
    flash[:success] = "Successfully updated quantity for #{item.title} to #{quantity}"
  end
end
