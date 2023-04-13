class DailyRecord < ApplicationRecord
  has_many :daily_record_items, dependent: :destroy
  has_many :foods, through: :daily_record_items
  accepts_nested_attributes_for :daily_record_items, allow_destroy: true
  has_many :custom_foods, through: :daily_record_items
  has_many :mysets, through: :daily_record_items
  belongs_to :user

  # enum meal_timing: { 朝食: 0, 昼食: 1, 夕食: 2, 間食: 3 }
  # validates :quantity, numericality: { greater_than: 0 }
  scope :by_date, ->(date) { where(created_at: date.all_day) }

  def start_time
    self.date # 日常記録の日付を表すカラム
  end

  # def consumed_calories
  #   self.daily_record_items.inject(0) do |sum, item|
  #     sum + item.food.calories * item.amount
  #   end
  # end
  
end
