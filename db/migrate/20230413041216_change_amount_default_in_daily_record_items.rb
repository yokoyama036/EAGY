class ChangeAmountDefaultInDailyRecordItems < ActiveRecord::Migration[6.1]
  def change
    change_column_default :daily_record_items, :amount, 100
  end
end
