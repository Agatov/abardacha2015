class OrdersController < ApplicationController
  def create
    order = Order.new order_params
    order.save
    OrderMailer.new_order(order).deliver_now
    render json: {status: :ok}
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone, :email)
  end
end