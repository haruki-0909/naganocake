class Public::OrdersController < ApplicationController


  def new
      @order = Order.new
  end

  def confirm
      @order = Order.new(order_params)
      @cart_items = CartItem.all
      @total = 0
  end

  def complete
  end

  private
  def order_params
      params.require(:order).permit(:payment_type, :postal_code, :address, :name)
  end

end
