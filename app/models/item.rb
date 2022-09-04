class Item < ApplicationRecord
  has_one_attached :image
  # has_many :items, dependent: :destroy

  belongs_to :genre

end
