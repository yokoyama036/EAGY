class ChangeMealTimingColumnTypeInDailyRecords < ActiveRecord::Migration[6.1]
  def up
    change_column :daily_records, :meal_timing, 'integer USING CAST(meal_timing AS integer)'
  end

  def down
    change_column :daily_records, :meal_timing, :string
  end
end
