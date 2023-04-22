require 'rails_helper'

RSpec.describe "DailyRecords", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:food) { FactoryBot.create(:food) }
  let!(:myset) { FactoryBot.create(:myset, user: user) }
  let!(:custom_food) { FactoryBot.create(:custom_food, user: user) }

  before do
    sign_in user
    # visit new_user_physical_information_path
  end

  describe "カスタム食材機能" do
    context "食材を追加するボタンを押した場合" do
      it "custom_foodが追加される" do
        visit new_user_physical_information_path
        fill_in "user_physical_information_name", with: "Test"
        fill_in "height", with: 170
        fill_in "weight", with: 70
        fill_in "age", with: 30
        select "低い", from: "activity_level"
        click_on "計算"
        click_on "Save"
  
        click_link '20', href: '/daily_records/new?date=2023-04-20'
        find('label', text: '食材追加').click
        click_link "食材を追加する"
        fill_in "custom_food_name", with: "Test_food"
        fill_in "custom_food_calorie", with: 170
        fill_in "custom_food_protein", with: 70
        fill_in "custom_food_carbo", with: 30
        fill_in "custom_food_fat", with: 30
        fill_in "custom_food_salt", with: 30
        fill_in "custom_food_unit", with: 30
        click_button "登録"
     
        expect(page).to have_content "追加食材を登録しました"
      end
    end
      context "削除ボタンを押した場合" do
      it "追加食材が削除される" do
        visit new_user_physical_information_path
        fill_in "user_physical_information_name", with: "Test"
        fill_in "height", with: 170
        fill_in "weight", with: 70
        fill_in "age", with: 30
        select "低い", from: "activity_level"
        click_on "計算"
        click_on "Save"
  
        click_link '20', href: '/daily_records/new?date=2023-04-20'
        find('label', text: '食材追加').click
        click_link "食材を追加する"
        fill_in "custom_food_name", with: "Test_food"
        fill_in "custom_food_calorie", with: 170
        fill_in "custom_food_protein", with: 70
        fill_in "custom_food_carbo", with: 30
        fill_in "custom_food_fat", with: 30
        fill_in "custom_food_salt", with: 30
        fill_in "custom_food_unit", with: 30
        click_button "登録"
        click_link "削除"
        sleep(0.5)
        accept_confirm
     
        expect(page).to have_content "追加食材を削除しました"
      end
    end
  end
end
