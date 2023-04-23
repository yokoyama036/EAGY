# require 'rails_helper'

# RSpec.describe DailyRecord, type: :model do
#   let(:user) { create(:user) }
#   let!(:daily_record) { create(:daily_record, user: user, date: Date.today) }

#   describe 'メソッド #consumed_calories' do
#     context 'デイリーレコードにアイテムが存在しない場合' do
#       it '消費カロリーとして0を返す' do
#         expect(daily_record.consumed_calories).to eq(0)
#       end
#     end

#     context 'デイリーレコードに食品アイテムが存在する場合' do
#       let!(:food) { create(:food) }
#       let!(:daily_record_item) { create(:daily_record_item, daily_record: daily_record, food: food, amount: 200) }

#       it '正しい消費カロリーを返すこと' do
#         expected_result = food.calorie * daily_record_item.amount / 100
#         expect(daily_record.consumed_calories).to eq(expected_result)
#       end
#     end
#   end
#     describe '#consumed_protein' do
#     context 'デイリーレコードにアイテムが存在しない場合' do
#       it '消費タンパク質として0を返す' do
#         expect(daily_record.consumed_protein).to eq(0)
#       end
#     end

#     context 'デイリーレコードに食品アイテムが存在する場合' do
#       let!(:food) { create(:food) }
#       let!(:daily_record_item) { create(:daily_record_item, daily_record: daily_record, food: food, amount: 200) }

#       it '正しい消費タンパク質を返すこと' do
#         expected_result = food.protein * daily_record_item.amount / 100
#         expect(daily_record.consumed_protein).to eq(expected_result)
#       end
#     end
#   end

#   describe '#consumed_carbo' do
#     context 'デイリーレコードにアイテムが存在しない場合' do
#       it '消費炭水化物として0を返す' do
#         expect(daily_record.consumed_carbo).to eq(0)
#       end
#     end

#     context 'デイリーレコードに食品アイテムが存在する場合' do
#       let!(:food) { create(:food) }
#       let!(:daily_record_item) { create(:daily_record_item, daily_record: daily_record, food: food, amount: 200) }

#       it '正しい消費炭水化物を返すこと' do
#         expected_result = food.carbo * daily_record_item.amount / 100
#         expect(daily_record.consumed_carbo).to eq(expected_result)
#       end
#     end
#   end

#   describe '#consumed_fat' do
#     context 'デイリーレコードにアイテムが存在しない場合' do
#       it '消費脂質として0を返す' do
#         expect(daily_record.consumed_fat).to eq(0)
#       end
#     end

#     context 'デイリーレコードに食品アイテムが存在する場合' do
#       let!(:food) { create(:food) }
#       let!(:daily_record_item) { create(:daily_record_item, daily_record: daily_record, food: food, amount: 200) }

#       it '正しい消費脂質を返すこと' do
#         expected_result = food.fat * daily_record_item.amount / 100
#         expect(daily_record.consumed_fat).to eq(expected_result)
#       end
#     end
#   end

#     describe '#consumed_salt' do
#     context 'デイリーレコードにアイテムが存在しない場合' do
#       it '消費塩分として0を返す' do
#         expect(daily_record.consumed_salt).to eq(0)
#       end
#     end

#     context 'デイリーレコードに食品アイテムが存在する場合' do
#       let!(:food) { create(:food) }
#       let!(:daily_record_item) { create(:daily_record_item, daily_record: daily_record, food: food, amount: 200) }

#       it '正しい消費塩分を返すこと' do
#         expected_result = food.salt * daily_record_item.amount / 100
#         expect(daily_record.consumed_salt).to eq(expected_result)
#       end
#     end
#   end
# end