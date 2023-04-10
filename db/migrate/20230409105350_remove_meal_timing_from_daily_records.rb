class RemoveMealTimingFromDailyRecords < ActiveRecord::Migration[6.1]
  def change
    remove_column :daily_records, :meal_timing, :integer
  end
end
