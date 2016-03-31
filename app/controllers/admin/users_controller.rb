class Admin::UsersController < Admin::BaseController
  def index
    @shop_admins = User.where(shop_id: current_user.shop_id)
  end

  def update
    @user = User.find(params[:id])
    change_admin_status
  end

  private
  
  def change_admin_status
    if @user.shop_id != nil
      remove_business_admin
    else
      make_business_admin
    end
  end

  def remove_business_admin
    business_admin_role = Role.find_by(name: "business_admin")
    UserRole.find_by(role_id: business_admin_role.id, user_id: @user.id).destroy
    @user.update(shop_id: nil)
    redirect_to admin_users_path
  end

  def make_business_admin
    @user.update(shop_id: current_user.shop_id)
    @user.roles << Role.find_by(name: "business_admin")
    redirect_to admin_users_path
  end
end
