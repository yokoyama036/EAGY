class CreateDailyRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_records do |t|
      t.bigint :food_id, foreign_key: true
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :myset_id, foreign_key: true
      t.integer :amount
      t.string :meal_timing
      t.date :date, null: false
      t.bigint :custom_id, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
