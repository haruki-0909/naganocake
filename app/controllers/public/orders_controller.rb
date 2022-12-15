class Public::OrdersController < ApplicationController


  def new
      @order = Order.new
  end

  def confirm
      @order = Order.new(order_params)
      @cart_items = CartItem.all
      @total = 0

  end

  def create
      cart_items = current_customer.cart_items.all
      @order = Order.new(order_params)
      if　@order.save
          cart_items.each do |cart|
          
      redirect_to orders_complete_path
      current_customer.cart_items.destroy_all
  end

  def complete
  end

  def show
      @cart_items = CartItem.all
  end

  def index
      @orders = Order.all
      @cart_items = CartItem.all
      @total = 0
  end

  private
  def order_params
      params.require(:order).permit(:customer_id, :postage, :billing_amount, :payment_type, :postal_code, :address, :name)
  end

end
