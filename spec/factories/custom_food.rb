FactoryBot.define do
  factory :custom_food do
    association :user
    sequence(:name) { |n| "Custom Food #{n}" }
    calorie { 200 }
    protein { 15 }
    carbo { 25 }
    fat { 10 }
    salt { 2 }
    unit { "100g" }
  end
end
