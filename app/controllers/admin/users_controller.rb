class Admin::UsersController < Admin::BaseController
  def index
    @non_admin_users = User.where(shop_id: nil)
    @shop_admins = User.where(shop_id: current_user.shop_id)
  end

  def update
    @user = User.find(params[:id])
    if @user.shop_id != nil
      #remove business_admin from roles array
      binding.pry
      redirect_to admin_users_path
    else
      @user.update(shop_id: current_user.shop_id)
      @user.roles.create(name: "business_admin")
      redirect_to admin_users_path
    end
  end
end
