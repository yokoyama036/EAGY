class DailyRecordItem < ApplicationRecord
  belongs_to :daily_record
  belongs_to :food, optional: true
  belongs_to :myset, optional: true
  belongs_to :custom, optional: true

  enum meal_timing: { 朝食: 0, 昼食: 1, 夕食: 2, 間食: 3 }
end
