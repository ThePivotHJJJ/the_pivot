class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find_by(slug: params[:shop])
    @shop_items = @shop.items
  end

  def new
    @shop = Shop.new
    visitor_must_login
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      current_user.roles << Role.find_by(name: "business_admin")
      current_user.update(shop_id: @shop.id)
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = "Invalid Entry, Try again."
      render new_shop_path
    end
  end

  def edit
    @shop = current_user.shop
  end

  def update
    @shop = current_user.shop
    if @shop.update(shop_params)
      redirect_to admin_dashboard_path
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
