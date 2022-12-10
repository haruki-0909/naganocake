class Public::CartItemsController < ApplicationController
   
  def create
      @cart_item = current_user.cart_items.build(cart_item_params)
      @cart_item.save
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :image_id, :amount)
  end

end
