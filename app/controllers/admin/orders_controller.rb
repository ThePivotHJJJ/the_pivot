class Admin::OrdersController < Admin::BaseController
  def index
    @orders = current_user.shop.orders
    @grid = OrdersGrid.new(params[:orders_grid]) do |scope|
      scope.page(params[:page])
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: params[:status].to_i)
    flash[:success] = "You have successfully updated Order#{@order.id} as #{@order.status}"
    redirect_to admin_orders_path
  end

  def show
    @order = Order.find(params[:id])
  end
end
