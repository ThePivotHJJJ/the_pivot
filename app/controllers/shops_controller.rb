class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find_by(slug: params[:shop])
    @items = @shop.items
  end

  def new
    @shop = Shop.new
    if !current_user
      flash[:info] = "Please login or create a new account."
      redirect_to login_path
    end
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      current_user.roles.create(name: "business_admin")
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = "Invalid Entry, Try again."
      render new_shop_path
    end
  end

private

  def shop_params
    params.require(:shop).permit(:name)
  end
end
