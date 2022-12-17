class Admin::OrdersController < ApplicationController

  def index
      @orders = Order.all
      @order_detail = OrderDetail.all
      @total = 0
  end

  def show
      @order = Order.find(params[:id])
      @total = 0
  end

end
