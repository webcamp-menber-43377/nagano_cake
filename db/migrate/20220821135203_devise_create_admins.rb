# frozen_string_literal: true

class DeviseCreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :admins, :email,                unique: true
    add_index :admins, :reset_password_token, unique: true
    # add_index :admins, :confirmation_token,   unique: true
    # add_index :admins, :unlock_token,         unique: true

    create_table :items do |t|
      ## ジャンルID
      t.integer  :genre_id, null: false
      ## 商品名
      t.string :name, null: false
      ## 商品説明文
      t.text :introduction, null: false
      ## 税抜き価格
      t.integer :price, null: false
      ## 販売ステータス
      t.boolean :is_active, null: false
    end

    create_table :genres do |t|
      ## ジャンル名
      t.string :name, null: false
    end

  end
end
