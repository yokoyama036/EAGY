class DailyRecordItem < ApplicationRecord
  belongs_to :daily_record
  belongs_to :food, optional: true
  belongs_to :myset, optional: true
  belongs_to :custom_food, optional: true

  enum meal_timing: { 朝食: 0, 昼食: 1, 夕食: 2, 間食: 3 }
  validates :meal_timing, presence: true, inclusion: { in: meal_timings.keys }
end
