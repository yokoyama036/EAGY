# require 'rails_helper'

# RSpec.describe Food, type: :model do
#   describe 'バリデーション' do
#     let(:food) { build(:food) }

#     %i[calorie protein carbo fat salt].each do |attribute|
#       context "#{attribute}が数値の場合" do
#         it 'バリデーションが通ること' do
#           food[attribute] = 100.0
#           expect(food).to be_valid
#         end
#       end

#       context "#{attribute}が数値でない場合" do
#         it 'バリデーションエラーになること' do
#           food[attribute] = 'invalid'
#           expect(food).to_not be_valid
#           expect(food.errors[attribute]).to include('数値で入力してください')
#         end
#       end
#     end
#   end
#   let(:food) do
#     Food.new(
#       calorie: 400,
#       protein: 30,
#       carbo: 50,
#       fat: 10,
#       salt: 1
#     )
#   end

#   describe '栄養素の合計値計算メソッド' do
#     context 'total_calorie' do
#       it '正しい合計カロリーを返すこと' do
#         amount = 200
#         expected_total_calories = 400 * amount / 100
#         expect(food.total_calorie(amount)).to eq(expected_total_calories)
#       end
#     end

#     context 'total_protein' do
#       it '正しい合計タンパク質を返すこと' do
#         amount = 200
#         expected_total_protein = 30 * amount / 100
#         expect(food.total_protein(amount)).to eq(expected_total_protein)
#       end
#     end

#     context 'total_carbo' do
#       it '正しい合計炭水化物を返すこと' do
#         amount = 200
#         expected_total_carbo = 50 * amount / 100
#         expect(food.total_carbo(amount)).to eq(expected_total_carbo)
#       end
#     end

#     context 'total_fat' do
#       it '正しい合計脂質を返すこと' do
#         amount = 200
#         expected_total_fat = 10 * amount / 100
#         expect(food.total_fat(amount)).to eq(expected_total_fat)
#       end
#     end

#     context 'total_salt' do
#       it '正しい合計塩分を返すこと' do
#         amount = 200
#         expected_total_salt = 1 * amount / 100
#         expect(food.total_salt(amount)).to eq(expected_total_salt)
#       end
#     end
#   end
# end