class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      ## 商品ID
      t.integer :item_id,   null: false
      ## 注文ID
      t.integer :orders_id, null: false
      ## 購入時価格（税込み）
      t.integer :price,     null: false
      ## 数量
      t.integer :amount,    null: false
      ## 製作ステータス
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
