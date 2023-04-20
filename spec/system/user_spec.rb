require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }

  describe 'ログイン要求' do
    context 'ログインに失敗した場合' do
      it 'ログイン画面が表示される' do
        visit new_user_session_path
        fill_in "Eメール", with: "123456@gmail.com"
        fill_in "パスワード", with: "111111"
        click_on "ログイン"
        expect(page).to have_content 'メールアドレスまたはパスワードが正しくありません。'
      end
    end
  end

  # describe 'ゲストログイン' do
  #   context 'ログインした場合' do
  #     it 'ゲストログインしたメッセージが表示される' do
  #       visit new_user_session_path
  #       click_link "Guest Login"
  #       expect(page).to have_content 'ゲストユーザーとしてログインしました'
  #     end
  #   end
  # end

  # describe 'ゲスト管理者ログイン' do
  #   context 'ログインした場合' do
  #     it 'ゲスト管理者ログイン画面が表示される' do
  #       visit new_user_session_path
  #       click_link "Admin Guest"
  #       expect(page).to have_content 'ゲスト管理者としてログインしました'
  #     end
  #   end
  # end

  # describe '新規作成機能' do
  #   context 'ユーザーを新規登録した場合' do
  #     it '身体情報登録ページへ遷移する' do
  #       visit new_user_registration_path
  #       fill_in "メールアドレス", with: "222222@gmail.com"
  #       fill_in "パスワード", with: "222222"
  #       fill_in "確認用パスワード", with: "222222"
  #       click_on "アカウント作成"
  #       expect(page).to have_content "アカウント登録が完了しました"
  #     end
  #   end
  # end

  # describe 'ユーザー表示' do
  #   context 'ユーザーアイコンを押した場合' do
  #     it 'ユーザー詳細画面が表示される' do
  #       visit new_user_session_path
  #       fill_in "Eメール", with: "123456@gmail.com"
  #       fill_in "パスワード", with: "123456"
  #       click_on "ログイン"
  #       find('.bi bi-people-fill').click
  #       expect(page).to have_content 'User Information'
  #     end
  #   end
  # end
end