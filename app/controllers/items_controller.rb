class ItemsController < ApplicationController
  def index
    @items = Item.all.page params[:page]
  end

  def show
    @item = find_item
  end

  def update
    @item = find_item
    @item.update_attributes(retired: true)
    redirect_to item_path(@item.id)
  end

private

  def item_params
    params.require(:item).permit(:title, :description, :price, :tag, :image)
  end
end
