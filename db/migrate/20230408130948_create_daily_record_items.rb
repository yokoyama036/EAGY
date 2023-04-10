class CreateDailyRecordItems < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_record_items do |t|
      t.references :daily_record, null: false, foreign_key: true
      t.references :food, foreign_key: true
      t.references :myset, foreign_key: true
      t.references :custom_food, foreign_key: true
      t.integer :amount
      t.timestamps
    end
  end
end
