class Food < ApplicationRecord
  has_many :daily_record_items, dependent: :destroy
  has_many :daily_records, through: :daily_record_items
  has_many :myset_foods, dependent: :destroy


  validates :calorie, numericality: true
  validates :protein, numericality: true
  validates :carbo, numericality: true
  validates :fat, numericality: true
  validates :salt, numericality: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end
  def search
    @q = Food.ransack(params[:q])
    @foods = @q.result
  end

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
