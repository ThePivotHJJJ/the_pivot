class PlatformAdmin::ShopsController < PlatformAdmin::BaseController
  def index
    @shops = Shop.all
  end

  def edit
    @shop = Shop.find_by(slug: params[:shop])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to platform_admin_shops_path
    else
      flash.now[:error] = "Invalid input"
      render :edit
    end
  end

private

  def shop_params
    params.require(:shop).permit(:name)
  end
end
