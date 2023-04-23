# require 'rails_helper'

# RSpec.describe DailyRecordItem, type: :model do
#   describe 'バリデーション' do
#     let(:daily_record_item) { build(:daily_record_item) }

#     context 'meal_timingが存在する場合' do
#       it 'バリデーションが通ること' do
#         daily_record_item.meal_timing = :朝食
#         expect(daily_record_item).to be_valid
#       end
#     end

#     context 'meal_timingが存在しない場合' do
#       it 'バリデーションエラーになること' do
#         daily_record_item.meal_timing = nil
#         expect(daily_record_item).to_not be_valid
#         expect(daily_record_item.errors[:meal_timing]).to include("分類を選択してください")
#       end
#     end

#     context 'meal_timingが不正な値の場合' do
#       it 'バリデーションエラーになること' do
#         daily_record_item.save! # Save the item first with a valid meal_timing
#         DailyRecordItem.connection.execute("UPDATE daily_record_items SET meal_timing = -1 WHERE id = #{daily_record_item.id}") # Directly update the meal_timing value in the database
#         daily_record_item.reload # Reload the item from the database
#         daily_record_item.valid?
#         expect(daily_record_item.errors[:meal_timing]).to include("リスト内から選択してください")
#       end
#     end
#   end
# end
