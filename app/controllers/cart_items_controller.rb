class CartItemsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:success] =
      "You added #{pluralize(@cart.cart_items.first.quantity, 'license')} for #{item.title}"
    redirect_to items_path
  end

  def show
    ids = session[:cart]
    @cart_items = @cart.cart_items
  end

  def destroy
    item = find_item
    @cart.remove_item(item.id)
    flash[:success] = "Successfully removed license for
    #{view_context.link_to item.title, item_path(item.id)}"
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
