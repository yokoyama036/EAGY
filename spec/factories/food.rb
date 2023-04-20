FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "Food #{n}" }
    calorie { 100 }
    protein { 10 }
    carbo { 20 }
    fat { 5 }
    salt { 1 }
    unit { "100g" }
  end
end
