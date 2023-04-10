class AddMealTimingToDailyRecordItems < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_record_items, :meal_timing, :integer
  end
end
