class Item < ApplicationRecord
  has_one_attached :image
  # has_many :items, dependent: :destroy

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_details, dependent: :destroy

  ## 消費税を求めるメソッド
  def with_tax_price
      (price * 1.1).floor
  end

end