class Food < ApplicationRecord
  has_many :daily_record_items
  has_many :daily_records, through: :daily_record_items
  has_many :myset_foods
  has_one_attached :image
end
