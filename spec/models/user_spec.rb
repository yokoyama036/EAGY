# require 'rails_helper'

# RSpec.describe User, type: :model do
#   describe 'バリデーション' do
#     context 'emailが存在しない場合' do
#       it '無効であること' do
#         user = build(:user, email: nil)
#         expect(user).not_to be_valid
#       end
#     end

#     context 'emailが一意でない場合' do
#       it '無効であること' do
#         user1 = create(:user, email: "test@example.com")
#         user2 = build(:user, email: "test@example.com")
#         expect(user2).not_to be_valid
#       end
#     end

#     context 'encrypted_passwordが存在しない場合' do
#       it '無効であること' do
#         user = build(:user, password: nil)
#         expect(user).not_to be_valid
#       end
#     end
#   end
#   # 以下は既存のテストコードです。変更はありません。
#   describe '.guest メソッド' do
#     context 'ゲストユーザーが存在しない場合' do
#       it 'ゲストユーザーを作成する' do
#         expect { User.guest }.to change { User.count }.by(1)
#         guest_user = User.find_by(email: 'guest@example.com')
#         expect(guest_user).to be_present
#       end
#     end

#     context 'ゲストユーザーが存在する場合' do
#       it '既存のゲストユーザーを返す' do
#         guest_user = User.create(email: 'guest@example.com', password: 'password123')
#         expect { User.guest }.not_to change { User.count }
#         expect(User.guest).to eq(guest_user)
#       end
#     end
#   end

#   describe '.guest_admin メソッド' do
#     context 'ゲスト管理者ユーザーが存在しない場合' do
#       it 'ゲスト管理者ユーザーを作成する' do
#         expect { User.guest_admin }.to change { User.count }.by(1)
#         guest_admin = User.find_by(email: 'guest_admin@example.com')
#         expect(guest_admin).to be_present
#         expect(guest_admin.admin).to be_truthy
#       end
#     end

#     context 'ゲスト管理者ユーザーが存在する場合' do
#       it '既存のゲスト管理者ユーザーを返す' do
#         guest_admin = User.create(email: 'guest_admin@example.com', password: 'password123', admin: true)
#         expect { User.guest_admin }.not_to change { User.count }
#         expect(User.guest_admin).to eq(guest_admin)
#       end
#     end
#   end
# end