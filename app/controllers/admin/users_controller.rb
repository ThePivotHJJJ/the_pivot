class Admin::UsersController < Admin::BaseController
  def index
    @non_admin_users = User.where(shop_id: nil)
    @shop_admins = User.where(shop_id: current_user.shop_id)
  end

  def update
    @user = User.find(params[:id])
    if @user.shop_id != nil
      business_admin_role = Role.find_by(name: "business_admin")
      user_ba_role = UserRole.find_by(role_id: business_admin_role.id, user_id: @user.id)
      user_ba_role.destroy
      @user.update(shop_id: nil)
      redirect_to admin_users_path
    else
      @user.update(shop_id: current_user.shop_id)
      @user.roles << Role.find_by(name: "business_admin")
      redirect_to admin_users_path
    end
  end
end
