require 'rails_helper'

RSpec.describe "DailyRecords", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:food) { FactoryBot.create(:food) }
    let!(:food2) { FactoryBot.create(:food2) }
  let!(:myset) { FactoryBot.create(:myset, user: user) }
  let!(:custom_food) { FactoryBot.create(:custom_food, user: user) }

  before do
    sign_in user
    # visit new_user_physical_information_path
  end

  describe "Myset管理機能" do
    context "myset作成を選択した場合" do
      it "新しいMysetが作成される" do
        visit new_user_physical_information_path
        fill_in "user_physical_information_name", with: "Test"
        fill_in "height", with: 170
        fill_in "weight", with: 70
        fill_in "age", with: 30
        select "低い", from: "activity_level"
        click_on "計算"
        click_on "Save"
        click_link '20', href: '/daily_records/new?date=2023-04-20'
        find('label[for="myset"]').click
        click_on "Myset作成"
        fill_in "myset_name", with: "Test_myset"
        click_on "作成"
        find("input[type='checkbox'][value='#{food.id}']").set(true)
        find("input[type='checkbox'][value='#{food2.id}']").set(true)
        click_button "記録"
        expect(page).to have_content "Test_myset"
      end
    end
    # context "mysetを作成したあとに" do
    #   it "食材の削除ができる" do
    #     visit new_user_physical_information_path
    #     fill_in "user_physical_information_name", with: "Test"
    #     fill_in "height", with: 170
    #     fill_in "weight", with: 70
    #     fill_in "age", with: 30
    #     select "低い", from: "activity_level"
    #     click_on "計算"
    #     click_on "Save"
    #     click_link '20', href: '/daily_records/new?date=2023-04-20'
    #     find('label[for="myset"]').click
    #     click_on "Myset作成"
    #     fill_in "myset_name", with: "Test_myset"
    #     click_on "作成"
    #     find("input[type='checkbox'][value='#{food.id}']").set(true)
    #     find("input[type='checkbox'][value='#{food2.id}']").set(true)
    #     click_button "記録"
    #     click_link "分量の変更・項目の削除"
    #     click_on "削除", match: :first
    #     # binding.pry
    #     # click_link(href: "/myset_foods/#{food.id}")
    #     # click_link "OK"
    #     sleep(2)
    #     accept_confirm

    #     expect(page).to have_content "食材を削除しました"
    #   end
    # end
    context "作成したMysetの中から" do
      it "任意のMysetを削除できる" do
        visit new_user_physical_information_path
        fill_in "user_physical_information_name", with: "Test"
        fill_in "height", with: 170
        fill_in "weight", with: 70
        fill_in "age", with: 30
        select "低い", from: "activity_level"
        click_on "計算"
        click_on "Save"
        click_link '20', href: '/daily_records/new?date=2023-04-20'
        find('label[for="myset"]').click
        click_on "削除", match: :first
        accept_confirm
        sleep(0.5)
      
        expect(page).to have_content "Mysetが削除されました"
      end
    end
  end
end
