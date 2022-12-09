class Public::OrdersController < ApplicationController

  def new
      @order = Order.new
      @customers = @order.customer
  end
end
