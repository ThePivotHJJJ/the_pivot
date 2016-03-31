class ManageAdminsController < ApplicationController
  def update
    @user = User.find_by(email: params[:user][:email])
    @user.update(shop_id: current_user.shop_id)
    @user.roles << Role.find_by(name: "business_admin")
    redirect_to admin_users_path
  end

  def destroy
    @user = User.find_by(email: params[:user][:email])
    business_admin_role = Role.find_by(name: "business_admin")
    UserRole.find_by(role_id: business_admin_role.id, user_id: @user.id).destroy
    @user.update(shop_id: nil)
    redirect_to admin_users_path
  end
end
