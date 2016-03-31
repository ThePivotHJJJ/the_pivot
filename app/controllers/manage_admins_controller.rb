class ManageAdminsController < ApplicationController
  def update
    add_business_admin(current_user.shop_id)
    redirect_to admin_users_path
  end

  def destroy
    remove_business_admin
    redirect_to admin_users_path
  end
end
