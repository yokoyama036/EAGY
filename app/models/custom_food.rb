class CustomFood < ApplicationRecord
  belongs_to :user
  has_many :myset_foods
  has_many :daily_record_items
  has_many :daily_records, through: :daily_record_items
  has_one_attached :image

  validates :calorie, numericality: true
  validates :protein, numericality: true
  validates :carbo, numericality: true
  validates :fat, numericality: true
  validates :salt, numericality: true



end
