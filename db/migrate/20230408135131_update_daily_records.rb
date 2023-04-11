class UpdateDailyRecords < ActiveRecord::Migration[6.1]
  def change
    remove_column :daily_records, :food_id, :bigint
    remove_column :daily_records, :myset_id, :bigint
    remove_column :daily_records, :amount, :integer
    remove_column :daily_records, :custom_id, :bigint
  end
end
