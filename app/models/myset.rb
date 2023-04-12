class Myset < ApplicationRecord
  belongs_to :user
  has_many :myset_foods, dependent: :destroy
  has_many :foods, through: :myset_foods
  has_one_attached :image
  accepts_nested_attributes_for :myset_foods, allow_destroy: true

  def total_calorie
    myset_foods.includes(:food).sum { |myset_food| myset_food.food.calorie }
  end

  def total_protein
    foods.sum(&:protein)
  end

  def total_carbo
    foods.sum(&:carbo)
  end

  def total_fat
    foods.sum(&:fat)
  end

  def total_salt
    foods.sum(&:salt)
  end
end
