class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # 0: 製作不可, 1:製作待ち, 2: 製作中, 3: 製作完了
  enum making_status: {
    impossible_manufacture: 0,
    waiting_manufacture: 1,
    manufacturing: 2,
    finish: 3
  }

  def subtotal
    item.with_tax_price * amount
  end

  def amount_sum
    OrderDetail.all.sum(:amount)
  end

end
