class Item < ApplicationRecord
  has_one_attached :image

  def add_tax_price
    (self.price * 1.08).round
  end

  has_many :cart_item, dependent: :destroy
  has_many :order_detail, dependent: :destroy

end
