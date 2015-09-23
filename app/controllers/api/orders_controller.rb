class Api::OrdersController < ApplicationController
  before_action :cors_set_access_control_headers


  def create
    order = Order.new order_params
    order.save
    OrderMailer.new_order(order).deliver_now
    render json: {status: :ok}
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  private

  def order_params
    params.require(:order).permit(:landing, :name, :phone, :email, :site, :city)
  end
end