class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      ## 会員ID
      t.integer :customer_id,         null: false
      ## 配送先郵便番号
      t.string :shipping_postal_code, null: false
      ## 配送先住所
      t.string :shipping_address,     null: false
      ## 送料
      t.integer :postage,             null: false
      ## 請求額
      t.integer :price,               null: false
      ## 支払方法
      t.string :payment,              null: false
      ## 受注ステータス
      t.boolean :is_active,           null: false, default: true

      t.timestamps
    end
  end
end
