module ApplicationHelper
  def platform_admin?
    current_user && current_user.platform_admin?
  end

  def business_admin?
    current_user && current_user.business_admin?
  end

  def admin?
    platform_admin? || business_admin?
  end
end
