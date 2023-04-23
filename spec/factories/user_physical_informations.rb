FactoryBot.define do
  factory :user_physical_information do
    name { "John Doe" }
    metabolism { 2000 }
    protein { 60.0 }
    carbo { 250.0 }
    fat { 70.0 }
    salt { 8.0 }
    user
  end
end
