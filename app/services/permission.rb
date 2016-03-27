class Permission
  extend Forwardable

  def_delegators :user,
                 :business_admin?,
                 :registered_user?

  def initialize(user)
    @user = user || User.new
  end

  def allow?(controller, action)
    @controller = controller
    @action     = action

    case
    when business_admin?
      store_admin_permissions
    when registered_user?
      registered_user_permissions
    else
      guest_user_permissions
    end
  end

private

    def business_admin_permissions
      return true if @controller == "admin/users" && @action.in?(%w(show index update))
      return true if @controller == "admin/orders" && @action.in?(%w(show index update))
      return true if @controller == "admin/items" && @action.in?(%w(create new edit update destroy))
      return true if @controller == "items" && @action.in?(%w(update))
    end

    def registered_user_permissions
      return true if @controller == "sessions" && action.in?(%w(destroy))
      return true if @controller == "users" && action.in?(%w(show edit update))
      return true if @controller == "orders" && action.in?(%w(show new create index))
      return true if @controller == "charges" && action.in?(%w(create index new edit show update destroy))
      return true if @controller == "shops" && action.in?(%w(create index new edit show update destroy))
    end

    def guest_user_permissions
      return true if @controller == "static_pages" && action.in?(%w(landing))
      return true if @controller == "sessions" && action.in?(%w(new create))
      return true if @controller == "users" && action.in?(%w(new create))
      return true if @controller == "cart_items" && action.in?(%w(create show destroy update))
      return true if @controller == "items" && action.in?(%w(index))
      return true if @controller == "tags" && action.in?(%w(index show))
      return true if @controller == "shops" && action.in?(%w(index))
    end
end
