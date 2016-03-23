class Admin::ItemsController < Admin::BaseController
  def new
    @item = item.new
  end

  def create
    @item = item.new(item_params)
    if @item.save
      tags = params[:tags].split(", ")
      @item.create_tags(tags)
      flash[:success] = "item has been successfully added"
      redirect_to item_path(@item)
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
      if params[:tags]
        tags = params[:tags].split(", ")
        @item.create_tags(tags)
      end
      redirect_to item_path(@item.id)
    else
      flash.now[:error] = "Invalid input"
      render :edit
    end
  end

  def destroy
    @item = find_item
    @item.destroy
    flash[:success] = "This item was successfully deleted."
    redirect_to root_url
  end

private

  def item_params
    params.require(:item).permit(:title, :description, :price, :tag, :image, :retired)
  end

  def redirect_to_back(default = root_url)
    if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end
end
