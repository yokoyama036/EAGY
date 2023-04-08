class DailyRecord < ApplicationRecord
  has_many :daily_records, dependent: :destroy
  has_many :custom_foods, dependent: :destroy
  has_many :mysets, dependent: :destroy
  belongs_to :user

  enum meal_timing: { 朝食: 0, 昼食: 1, 夕食: 2, 間食: 3 }
  # validates :quantity, numericality: { greater_than: 0 }
  scope :by_date, ->(date) { where(created_at: date.all_day) }

  def start_time
    self.date # これは日常記録の日付を表すカラムです。
  end
end
