class Myset < ApplicationRecord
  belongs_to :user
  has_many :myset_foods, dependent: :destroy
  has_many :foods, through: :myset_foods
  has_many :custom_foods, through: :myset_foods
  accepts_nested_attributes_for :myset_foods, allow_destroy: true
  has_one_attached :image


  def total_calorie(amount)
    myset_foods.includes(:food).sum { |myset_food| myset_food.food.total_calorie(myset_food.amount * amount / 100) }
  end

  def total_protein(amount)
    myset_foods.includes(:food).sum { |myset_food| myset_food.food.total_protein(myset_food.amount * amount / 100) }
  end

  def total_carbo(amount)
    myset_foods.includes(:food).sum { |myset_food| myset_food.food.total_carbo(myset_food.amount * amount / 100) }
  end

  def total_fat(amount)
    myset_foods.includes(:food).sum { |myset_food| myset_food.food.total_fat(myset_food.amount * amount / 100) }
  end

  def total_salt(amount)
    myset_foods.includes(:food).sum { |myset_food| myset_food.food.total_salt(myset_food.amount * amount / 100) }
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

end
