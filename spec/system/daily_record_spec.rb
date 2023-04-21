require 'rails_helper'

RSpec.describe "DailyRecords", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:food1) { FactoryBot.create(:food1) }
  let(:food2) { FactoryBot.create(:food2) }
  let(:myset) { FactoryBot.create(:myset, user: user) }
  let(:custom_food) { FactoryBot.create(:custom_food, user: user) }
  let(:valid_attributes) {
    {
      date: Date.today,
      daily_record_items_attributes: [
        {
          food1_id: food1.id,
          meal_timing: "breakfast"
        },
        {
          myset_id: myset.id,
          meal_timing: "lunch"
        },
        {
          custom_food_id: custom_food.id,
          meal_timing: "dinner"
        }
      ]
    }
  }

  before do
    sign_in user
    # visit new_user_physical_information_path
  end

  describe "新しい記録の作成" do
    context "有効なパラメータの場合" do
      it "新しいDailyRecordを作成する" do
        visit new_user_physical_information_path
        fill_in "user_physical_information_name", with: "Test"
        fill_in "height", with: 170
        fill_in "weight", with: 70
        fill_in "age", with: 30
        # choose "male"
        select "低い", from: "activity_level"
        click_on "計算"
        click_on "Save"
        # info = {
        # name: "Test User",
        # height: 170,
        # weight: 70,
        # age: 30,
        # # gender: "男性",
        # activity_level: "低い"
        # }
    
        # enter_physical_information メソッドを呼び出す
        # enter_physical_information(info)
        click_link '20', href: '/daily_records/new?date=2023-04-20'

        
        check "food_ids[]", with: food1.id
        select "朝食", from: "food_selections[#{food1.id}]"
        binding.pry

        select "朝食", from: "daily_record[daily_record_items_attributes][0][meal_timing]"
    
        select myset.name, from: "daily_record[daily_record_items_attributes][1][myset_id]"
        select "昼食", from: "daily_record[daily_record_items_attributes][1][meal_timing]"
    
        select custom_food.name, from: "daily_record[daily_record_items_attributes][2][custom_food_id]"
        select "夕食", from: "daily_record[daily_record_items_attributes][2][meal_timing]"
    
        expect {
          click_button "登録する"
        }.to change(DailyRecord, :count).by(1)
    
        expect(page).to have_content "記録したい日付を選択してください"
      end
  

   
    #   it "作成されたdaily_recordにリダイレクトする" do
    #     post :create, params: { daily_record: valid_attributes }
    #     expect(response).to redirect_to(daily_record_url(DailyRecord.last))
    #   end
    # end

    # context "無効なパラメータの場合" do
    #   it "新しいDailyRecordを作成しない" do
    #     invalid_attributes = valid_attributes.deep_dup
    #     invalid_attributes[:date] = nil
    #     expect {
    #       post :create, params: { daily_record: invalid_attributes }
    #     }.to_not change(DailyRecord, :count)
    #   end

    #   it "newテンプレートをレンダリングする" do
    #     invalid_attributes = valid_attributes.deep_dup
    #     invalid_attributes[:date] = nil
    #     post :create, params: { daily_record: invalid_attributes }
    #     expect(response).to render_template("new")
    #   end
    end
  end
end
