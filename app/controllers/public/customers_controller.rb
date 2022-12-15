class Public::CustomersController < ApplicationController

  def show
      @customer = current_customer
  end

  def edit
      @customer = current_customer
  end

  def update
      @customer = current_customer
      @customer.update(customer_params)
      redirect_to public_customer_path
  end

  def check
      @customer = Customer.find_by(email: params[:email])
  end

  def withdraw
      @customer = Customer.find_by(email: params[:email])
      @customer.withdraw(is_deleted: false)
      reset_session
      redirect_to root_path
  end

  private

  def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end

end
