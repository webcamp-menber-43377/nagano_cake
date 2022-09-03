class Item < ApplicationRecord
  has_one_attached :image
  # has_many :items, dependent: :destroy

  belongs_to :genre

  enum is_active: { "販売中": true, "販売停止中": false }
end
