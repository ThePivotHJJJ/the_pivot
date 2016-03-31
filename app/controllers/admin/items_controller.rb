class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @item.create_tags(params[:tags].split(", "))
      current_user.shop.items << @item

      flash[:success] = "item has been successfully added"
      redirect_to shop_item_path(shop: @item.shop.slug, id: @item.id)
    else
      flash.now[:error] = "Invalid Entry, Try again."
      render new_admin_item_path
    end
  end

  def edit
    @item = find_item
  end

  def update
    @item = find_item
    if @item.update(item_params)
      @item.create_tags(params[:tags].split(", ")) if params[:tags]
      redirect_to shop_item_path(shop: @item.shop.slug, id: @item.id)
    else
      flash.now[:error] = "Invalid input"
      render :edit
    end
  end

  def destroy
    find_item.destroy
    flash[:success] = "This item was successfully deleted."
    redirect_to root_url
  end

private
  def item_params
    params.require(:item).permit(:title, :description, :price, :tag, :image, :retired, :bid)
  end
end
