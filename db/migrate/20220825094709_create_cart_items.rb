class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      ## 商品ID
      t.integer :item_id,     null: false
      ## 会員ID
      t.integer :customer_id, null: false
      ## 数量
      t.integer :amount,      null: false

      t.timestamps
    end
  end
end
