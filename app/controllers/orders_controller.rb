class OrdersController < ApplicationController
  around_action :wrap_in_transaction, only: :create

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    if current_user
      @user = current_user
      @order = OrderProcessor.new(@cart, @user).process_order
      session[:cart].clear
      redirect_to new_charge_path(order: @order)
    else
      visitor_must_login
    end
  end

private

  def wrap_in_transaction
    ActiveRecord::Base.transaction do
      begin
        yield
      end
    end
  end
end
