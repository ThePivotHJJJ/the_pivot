class PlatformAdmin::UsersController < PlatformAdmin::BaseController
  def show
  end

  def index
    @user = User.new
    @shop_admins = User.where.not(shop_id: nil)
  end
end
