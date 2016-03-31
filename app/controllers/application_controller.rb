class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart
  before_action :authorize!
  helper_method :current_user, :format_price, :find_item, :visitor_must_login

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorize!
    unless authorized?
      redirect_to root_url, danger: "You are not allow to visit this page."
    end
  end

  def authorized?
    current_permission.allow?(params[:controller], params[:action])
  end

  def find_item
    Item.find(params[:id])
  end

  def format_price(number)
    "$#{sprintf('%.2f', number.to_f/100)}"
  end

  def visitor_must_login
    if !current_user
      flash[:info] = "Please login or create a new account."
      redirect_to login_path
    end
  end

  def remove_business_admin
    user = User.find_by(email: params[:user][:email])
    business_admin_role = Role.find_by(name: "business_admin")
    UserRole.find_by(role_id: business_admin_role.id, user_id: user.id).destroy
    user.update(shop_id: nil)
    user.save
  end

  def add_business_admin(shop_id)
    user = User.find_by(email: params[:user][:email])
    user.update(shop_id: shop_id)
    user.roles << Role.find_by(name: "business_admin")
  end
end
