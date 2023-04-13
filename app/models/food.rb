class Food < ApplicationRecord
  has_many :daily_record_items
  has_many :daily_records, through: :daily_record_items
  has_many :myset_foods
  has_one_attached :image

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
