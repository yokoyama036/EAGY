# require 'rails_helper'

# RSpec.describe "DailyRecords", type: :system do
#   let!(:user) { FactoryBot.create(:user) }
#   let!(:food) { FactoryBot.create(:food) }
#   let!(:food2) { FactoryBot.create(:food2) }
#   let!(:myset) { FactoryBot.create(:myset, user: user) }
#   let!(:custom_food) { FactoryBot.create(:custom_food, user: user) }

#   before do
#     sign_in user
#   end

#   describe "新しい記録の作成" do
#     context "Foodとmeal_timingを選択した場合" do
#       it "Foodが登録される" do
#         visit new_user_physical_information_path
#         fill_in "user_physical_information_name", with: "Test"
#         fill_in "height", with: 170
#         fill_in "weight", with: 70
#         fill_in "age", with: 30
#         select "低い", from: "activity_level"
#         click_on "計算"
#         click_on "Save"
  
#         click_link '20', href: '/daily_records/new?date=2023-04-20'
#         find("input[type='checkbox'][value='#{food.id}']").set(true)
#         select "朝食", from: "daily_record[daily_record_items][food_selections[#{food.id}]]"
#         click_button "記録"
     
#         expect(page).to have_content "サンプル食品"
#       end
#     end
#     context "mysetとmeal_timingを選択した場合" do
#       it "Mysetが登録される" do
#         visit new_user_physical_information_path
#         fill_in "user_physical_information_name", with: "Test"
#         fill_in "height", with: 170
#         fill_in "weight", with: 70
#         fill_in "age", with: 30
#         select "低い", from: "activity_level"
#         click_on "計算"
#         click_on "Save"
#         click_link '20', href: '/daily_records/new?date=2023-04-20'
#         find('label[for="myset"]').click
#         find("input[type='checkbox'][value='#{myset.id}']").set(true)
#         select "朝食", from: "daily_record[daily_record_items][myset_selections[#{myset.id}]]"
#         click_button "記録"
     
#         expect(page).to have_content "朝食1"
#       end
#     end
#     context "custom_foodとmeal_timingを選択した場合" do
#       it "custom_foodが登録される" do
#         visit new_user_physical_information_path
#         fill_in "user_physical_information_name", with: "Test"
#         fill_in "height", with: 170
#         fill_in "weight", with: 70
#         fill_in "age", with: 30
#         select "低い", from: "activity_level"
#         click_on "計算"
#         click_on "Save"
#         click_link '20', href: '/daily_records/new?date=2023-04-20'
#         find('label', text: '食材追加').click
#         find("input[type='checkbox'][value='#{custom_food.id}']").set(true)
#         select "朝食", from: "daily_record[daily_record_items][custom_food_selections[#{custom_food.id}]]"
#         click_button "記録"
     
#         expect(page).to have_content "カスタム食品1"
#       end
#     end
#     context "無効なパラメータの場合" do
#       it "記録されない" do
#         visit new_user_physical_information_path
#         fill_in "user_physical_information_name", with: "Test"
#         fill_in "height", with: 170
#         fill_in "weight", with: 70
#         fill_in "age", with: 30
#         select "低い", from: "activity_level"
#         click_on "計算"
#         click_on "Save"
  
#         click_link '20', href: '/daily_records/new?date=2023-04-20'
#         find("input[type='checkbox'][value='#{food.id}']").set(true)
#         click_button "記録"
     
#         expect(page).to have_content "記録できませんでした"
#       end
#     end
#     context "食材タブで検索をした場合" do
#       it "食材が絞り込まれる" do
#         visit new_user_physical_information_path
#         fill_in "user_physical_information_name", with: "Test"
#         fill_in "height", with: 170
#         fill_in "weight", with: 70
#         fill_in "age", with: 30
#         select "低い", from: "activity_level"
#         click_on "計算"
#         click_on "Save"
#         click_link '20', href: '/daily_records/new?date=2023-04-20'
#         fill_in "q[name_cont]", with: "サンプル食品1"
#         click_on "検索"
#         sleep(0.5)

#         expect(page).to have_content "サンプル食品1"
#       end
#     end
#     context "複数の食材を選択した場合" do
#       it "同時に記録される" do
#         visit new_user_physical_information_path
#         fill_in "user_physical_information_name", with: "Test"
#         fill_in "height", with: 170
#         fill_in "weight", with: 70
#         fill_in "age", with: 30
#         select "低い", from: "activity_level"
#         click_on "計算"
#         click_on "Save"
#         click_link '20', href: '/daily_records/new?date=2023-04-20'
#         find("input[type='checkbox'][value='#{food.id}']").set(true)
#         select "朝食", from: "daily_record[daily_record_items][food_selections[#{food.id}]]"
#         find("input[type='checkbox'][value='#{food2.id}']").set(true)
#         select "朝食", from: "daily_record[daily_record_items][food_selections[#{food2.id}]]"

#         click_button "記録"
  
#         expect(page).to have_content "サンプル食品1"
#         expect(page).to have_content "サンプル食品2"
#       end
#     end
#     context "記録した食材の削除ボタンを押した場合" do
#       it "記録から食材が削除される" do
#         visit new_user_physical_information_path
#         fill_in "user_physical_information_name", with: "Test"
#         fill_in "height", with: 170
#         fill_in "weight", with: 70
#         fill_in "age", with: 30
#         select "低い", from: "activity_level"
#         click_on "計算"
#         click_on "Save"
#         click_link '20', href: '/daily_records/new?date=2023-04-20'
#         find("input[type='checkbox'][value='#{food.id}']").set(true)
#         select "朝食", from: "daily_record[daily_record_items][food_selections[#{food.id}]]"
#         find("input[type='checkbox'][value='#{food2.id}']").set(true)
#         select "朝食", from: "daily_record[daily_record_items][food_selections[#{food2.id}]]"
#         click_button "記録"
#         click_on "削除", match: :first
#         accept_confirm
#         sleep(0.5)
          
#         expect(page).not_to have_content "サンプル食品1"
#       end
#     end
#   end
# end
