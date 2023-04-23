# require 'rails_helper'

# RSpec.describe UserPhysicalInformation, type: :model do
#   describe 'バリデーション' do
#     let(:user) { create(:user) }
#     let(:user_physical_information) { build(:user_physical_information, user: user) }

#     context 'metabolismが存在する場合' do
#       it '有効であること' do
#         expect(user_physical_information).to be_valid
#       end
#     end

#     context 'metabolismが存在しない場合' do
#       it '無効であること' do
#         user_physical_information.metabolism = nil
#         expect(user_physical_information).to_not be_valid
#         expect(user_physical_information.errors.messages[:metabolism]).to include('必要エネルギー量が計算されていません。')
#       end
#     end

#     context 'metabolismが数値でない場合' do
#       it '無効であること' do
#         user_physical_information.metabolism = "abc"
#         expect(user_physical_information).to_not be_valid
#         expect(user_physical_information.errors.messages[:metabolism]).to include('数値を入力してください')
#       end
#     end
#   end
# end
