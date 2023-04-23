# require 'rails_helper'

# RSpec.describe Myset, type: :model do
#   let(:user) { FactoryBot.create(:user) }

#   describe 'バリデーション' do
#     let(:myset) { Myset.new(name: name, user_id: user.id) }

#     context 'name属性' do
#       context '正しい場合' do
#         let(:name) { 'テストマイセット' }
#         it '有効であること' do
#           expect(myset).to be_valid
#         end
#       end

#       context '存在しない場合' do
#         let(:name) { nil }
#         it '無効であること' do
#           expect(myset).to be_invalid
#           expect(myset.errors[:name]).to include('myset名を入力してください')
#         end
#       end

#       context '20文字を超える場合' do
#         let(:name) { 'あ' * 21 }
#         it '無効であること' do
#           expect(myset).to be_invalid
#           expect(myset.errors[:name]).to include('20文字以内で入力してください')
#         end
#       end
#     end
#   end

#   describe '合計栄養素計算メソッド' do
#     let!(:myset) { FactoryBot.create(:myset, user_id: user.id) }
#     let!(:food) { FactoryBot.create(:food) }
#     let!(:custom_food) { FactoryBot.create(:custom_food, user_id: user.id) }
#     let!(:myset_food1) { FactoryBot.create(:myset_food1, myset: myset, food: food, custom_food: nil, amount: 100) }
#     let!(:myset_food2) { FactoryBot.create(:myset_food2, myset: myset, food: nil, custom_food: custom_food, amount: 100) }
#     let(:amount) { 100 }

#     it 'total_calorieが正確に計算されること' do
#       expect(myset.total_calorie(amount)).to eq(food.total_calorie(100) + custom_food.total_calorie(100))
#     end

#     it 'total_proteinが正確に計算されること' do
#       expect(myset.total_protein(amount)).to eq(food.total_protein(100) + custom_food.total_protein(100))
#     end

#     it 'total_carboが正確に計算されること' do
#       expect(myset.total_carbo(amount)).to eq(food.total_carbo(100) + custom_food.total_carbo(100))
#     end

#     it 'total_fatが正確に計算されること' do
#       expect(myset.total_fat(amount)).to eq(food.total_fat(100) + custom_food.total_fat(100))
#     end

#     it 'total_saltが正確に計算されること' do
#       expect(myset.total_salt(amount)).to eq(food.total_salt(100) + custom_food.total_salt(100))
#     end
#   end
# end
