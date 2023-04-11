class CustomFood < ApplicationRecord
  belongs_to :user
  has_many :myset_foods
  has_many :daily_records
  has_many :daily_record_items
  has_one_attached :image
end
