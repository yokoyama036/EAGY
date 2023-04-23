FactoryBot.define do
  factory :daily_record_item do
    association :daily_record
    association :food
    amount { 100 }
    meal_timing { 0 } # 0としていますが、実際のmeal_timingの値に応じて変更してください
  end
end
