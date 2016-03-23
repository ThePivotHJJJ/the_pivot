class ItemsController < ApplicationController
  def index
    @items = item.all.page params[:page]
  end

  def show
    @item = find_item
  end

  def create
    @item = item.new(item_params)
    if @item.save
      tags = params[:tags].split(",")
      @item.create_tags(tags)
      flash[:success] = "item has been successfully added"
      redirect_to item_path(@item)
    else
      flash.now[:error] = "Invalid Entry, Try again."
      render new_admin_item_path
    end
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
