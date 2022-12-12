class Public::OrdersController < ApplicationController
  before_action :order_params, only: [:edit]


  def new
      @order = Order.new
  end

  def confirm
      @order = Order.new(order_params)
  end

  private
  def order_params
      params.require(:order).permit(:payment_type, :postal_code, :address, :name)
  end

end
