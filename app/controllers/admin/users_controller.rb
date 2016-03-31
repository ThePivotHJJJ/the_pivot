class Admin::UsersController < Admin::BaseController
  def index
    @shop_admins = User.where(shop_id: current_user.shop_id)
    @user = User.new
  end
end
