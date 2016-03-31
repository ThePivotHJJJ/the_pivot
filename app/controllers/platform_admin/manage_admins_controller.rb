class PlatformAdmin::ManageAdminsController < PlatformAdmin::BaseController
  def update
    add_business_admin(params[:user][:shop_id])
    redirect_to platform_admin_users_path
  end

  def destroy
    remove_business_admin
    redirect_to platform_admin_users_path
  end
end
