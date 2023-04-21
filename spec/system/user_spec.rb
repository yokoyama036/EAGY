# require 'rails_helper'
# RSpec.describe 'ユーザー管理機能', type: :system do
#   let!(:user) { FactoryBot.create(:user) }

#   describe 'ログイン要求' do
#     context 'ログインに失敗した場合' do
#       it 'エラーメッセージが表示される' do
#         visit new_user_session_path
#         fill_in "user_email", with: "123456@gmail.com"
#         fill_in "user_password", with: "111111"
#         click_on "ログイン"
#         expect(page).to have_content 'パスワードが正しくありません'
#       end
#     end
#   end

#   context '正しい情報を入力した場合' do
#     it 'ログインできる' do
#       visit new_user_session_path
#       fill_in "user_email", with: "123456@gmail.com"
#       fill_in "user_password", with: "123456"
#       click_on "ログイン"
#       expect(page).to have_content 'ログインしました'
#     end
#   end

#   describe 'ゲストログイン' do
#     context 'ログインした場合' do
#       it 'ゲストログインしたメッセージが表示される' do
#         visit new_user_session_path
#         click_link "Guest Login"
#         expect(page).to have_content 'ゲストユーザーとしてログインしました'
#       end
#     end
#   end

#   describe 'ゲスト管理者ログイン' do
#     context 'ログインした場合' do
#       it 'ゲスト管理者ログイン画面が表示される' do
#         visit new_user_session_path
#         click_link "Admin Guest"
#         expect(page).to have_content 'ゲスト管理者としてログインしました'
#       end
#     end
#   end

#   describe '新規作成機能' do
#     context 'ユーザーを新規登録した場合' do
#       it '身体情報登録ページへ遷移する' do
#         visit new_user_registration_path
#         fill_in "user_email", with: "222222@gmail.com"
#         fill_in "user_password", with: "222222"
#         fill_in "user_password_confirmation", with: "222222"
#         click_on "アカウント作成"
#         expect(page).to have_content "アカウント登録が完了しました"
#       end
#     end
#   end
# end