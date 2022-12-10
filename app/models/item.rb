class Item < ApplicationRecord
  has_one_attached :image

  def with_tax_price
    (price * 1.1).floor
  end

  has_many :cart_item, dependent: :destroy
  has_many :order_detail, dependent: :destroy

end
