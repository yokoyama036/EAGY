class CustomFood < ApplicationRecord
  belongs_to :user
  has_many :myset_foods, dependent: :destroy
  has_many :daily_record_items, dependent: :destroy
  has_many :daily_records, through: :daily_record_items

  validates :name, presence: true, length: { maximum: 20 }
  validates :calorie, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :protein, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :carbo, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :fat, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :salt, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :unit, presence: true

  def total_calorie(amount)
    calorie * amount / 100
  end

  def total_protein(amount)
    protein * amount / 100
  end

  def total_carbo(amount)
    carbo * amount / 100
  end

  def total_fat(amount)
    fat * amount / 100
  end

  def total_salt(amount)
    salt * amount / 100
  end
end
