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
      ## 製造ステータス ／enumで管理, {0: 製作不可, 1:製作待ち, 2: 製作中, 3: 製作完了}
      t.integer :making_status, null: false, default: 0

      t.timestamps
    end
  end
end
