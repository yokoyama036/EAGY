require 'rails_helper'

RSpec.describe DailyRecordsController, type: :controller do
  let(:user) { create(:user) }
  let(:food) { create(:food) }
  let(:myset) { create(:myset, user: user) }
  let(:custom_food) { create(:custom_food, user: user) }
  let(:valid_attributes) {
    {
      date: Date.today,
      daily_record_items_attributes: [
        {
          food_id: food.id,
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
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new DailyRecord" do
        expect {
          post :create, params: { daily_record: valid_attributes }
        }.to change(DailyRecord, :count).by(1)
      end

      it "redirects to the created daily_record" do
        post :create, params: { daily_record: valid_attributes }
        expect(response).to redirect_to(daily_record_url(DailyRecord.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new DailyRecord" do
        invalid_attributes = valid_attributes.deep_dup
        invalid_attributes[:date] = nil
        expect {
          post :create, params: { daily_record: invalid_attributes }
        }.to_not change(DailyRecord, :count)
      end

      it "renders the 'new' template" do
        invalid_attributes = valid_attributes.deep_dup
        invalid_attributes[:date] = nil
        post :create, params: { daily_record: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end
end
