class CustomFood < ApplicationRecord
  belongs_to :user
  has_many :myset_foods
  has_many :daily_records
  has_one_attached :image
end
