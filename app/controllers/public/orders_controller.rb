class Public::OrdersController < ApplicationController

  def new
      @order = Order.new
  end

  def confirm
      @order = Order.new(order_params)
      @cart_items = CartItem.all
      @total = 0
      if params[:order][:address_number] == "1"
         @order.name = current_customer.last_name + current_customer.first_name
         @order.address = current_customer.address
         @order.postal_code = current_customer.postal_code
      elsif params[:order][:address_number] == "2"
        @order = Order.new(order_params)
      end
  end

  def create
      cart_items = current_customer.cart_items.all
      @order = Order.new(order_params)
      @order.save
        cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.tax_price = cart.item.price
        order_detail.save
        end
        redirect_to orders_complete_path

  end

  def complete
      current_customer.cart_items.destroy_all
  end

  def show
      @order = Order.find(params[:id])
      @total = 0
  end

  def index
      @orders = Order.all
      @order_detail = OrderDetail.all
      @total = 0
  end

  private
  def order_params
      params.require(:order).permit(:customer_id, :postage, :billing_amount, :payment_type, :postal_code, :address, :name)
  end
  def address_params
  params.require(:order).permit(:name, :address, :postal_code)
  end
end
