class Food < ApplicationRecord
  belongs_to :daily_records
  has_many :myset_foods
  has_one_attached :image
end
