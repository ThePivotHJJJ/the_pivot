class ChargesController < ApplicationController
  before_action :get_order_amount, only: [:new, :create]

  def new
  end

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "items_for_good",
      :currency    => 'usd'
    )

  order = Order.last
  order.update_status_paid
  flash[:success] = "Thank you for your contribution of #{format_price(@amount)}!"
  redirect_to order_path(order)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

private

  def get_order_amount
    @amount = Order.last.total_price
  end
end
