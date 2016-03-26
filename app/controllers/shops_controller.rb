class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    shop = Shop.find_by(slug: params[:shop])
    @items = shop.items
  end

  def new
    if !current_user
      flash[:info] = "Please login or create a new account."
      redirect_to login_path
    end
  end
end
