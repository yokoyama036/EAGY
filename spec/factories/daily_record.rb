# FactoryBot.define do
#   factory :user do
#     email { "test@example.com" }
#     password { "password" }
#     password_confirmation { "password" }
#   end

#   factory :food1, class: Food do
#     name { "サンプル食品1" }
#     calorie { 300 }
#     protein { 10 }
#     carbo { 20 }
#     fat { 5 }
#     salt { 1 }
#     unit { 100 }
#   end

#   factory :food2, class: Food do
#     name { "サンプル食品2" }
#     calorie { 250 }
#     protein { 8 }
#     carbo { 30 }
#     fat { 7 }
#     salt { 1.5 }
#     unit { 120 }
#   end

#   factory :custom_food do
#     user_id { 1 }
#     name { "カスタム食品1" }
#     calorie { 350 }
#     protein { 12 }
#     carbo { 25 }
#     fat { 6 }
#     salt { 1.2 }
#     unit { 100 }
#   end

#   factory :myset do
#     user_id { 1 }
#     name { "朝食1" }
#   end

#   factory :myset_food1, class: MysetFood do
#     association :myset
#     association :food, factory: :food1
#     amount { 1 }
#   end

#   factory :myset_food2, class: MysetFood do
#     association :myset
#     association :custom_food
#     amount { 1 }
#   end
# end
