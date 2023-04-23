# require 'rails_helper'

# RSpec.describe CustomFood, type: :model do
#   let(:user) { FactoryBot.create(:user) }
#   let(:custom_food) do
#     CustomFood.new(
#       name: "テスト食品",
#       calorie: 400.0,
#       protein: 30.0,
#       carbo: 50.0,
#       fat: 10.0,
#       salt: 0.5,
#       unit: "g",
#       user_id: user.id
#     )
#   end

#   describe 'バリデーション' do
#     it '全ての属性が正しく設定されている場合、有効であること' do
#       expect(custom_food).to be_valid
#     end

#     context 'name' do
#       it '存在しない場合、無効であること' do
#         custom_food.name = nil
#         expect(custom_food).to_not be_valid
#         expect(custom_food.errors[:name]).to include("食材名を入力してください")
#       end

#       it '20文字を超える場合、無効であること' do
#         custom_food.name = "a" * 21
#         expect(custom_food).to_not be_valid
#         expect(custom_food.errors[:name]).to include("20文字以内で入力してください")
#       end
#     end

#     %i[calorie protein carbo fat salt].each do |attribute|
#       context "#{attribute}" do
#         it '存在しない場合、無効であること' do
#           custom_food[attribute] = nil
#           expect(custom_food).to_not be_valid
#           expect(custom_food.errors[attribute]).to include("数値で入力してください")
#         end

#         it '0未満の場合、無効であること' do
#           custom_food[attribute] = -1
#           expect(custom_food).to_not be_valid
#           expect(custom_food.errors[attribute]).to include("0以上の値にしてください")
#         end
#       end
#     end

#     context 'unit' do
#       it '存在しない場合、無効であること' do
#         custom_food.unit = nil
#         expect(custom_food).to_not be_valid
#         expect(custom_food.errors[:unit]).to include("単位数量を入力してください")
#       end
#     end
#   end

#   describe '栄養素の合計値計算メソッド' do
#     context 'total_calorie' do
#       it '正しい合計カロリーを返すこと' do
#         amount = 200
#         expected_total_calories = 400 * amount / 100
#         expect(custom_food.total_calorie(amount)).to eq(expected_total_calories)
#       end
#     end

#     context 'total_protein' do
#       it '正しい合計タンパク質を返すこと' do
#         amount = 200
#         expected_total_protein = 30 * amount / 100
#         expect(custom_food.total_protein(amount)).to eq(expected_total_protein)
#       end
#     end
#     context 'total_carbo' do
#       it '正しい合計炭水化物を返すこと' do
#         amount = 200
#         expected_total_carbo = 50 * amount / 100
#         expect(custom_food.total_carbo(amount)).to eq(expected_total_carbo)
#       end
#     end
    
#     context 'total_fat' do
#       it '正しい合計脂質を返すこと' do
#         amount = 200
#         expected_total_fat = 10 * amount / 100
#         expect(custom_food.total_fat(amount)).to eq(expected_total_fat)
#       end
#     end
    
#     context 'total_salt' do
#       it '正しい合計塩分を返すこと' do
#         amount = 200
#         expected_total_salt = 0.5 * amount / 100
#         expect(custom_food.total_salt(amount)).to eq(expected_total_salt)
#       end
#     end
#   end
# end