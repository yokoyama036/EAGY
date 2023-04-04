class CreateMysetFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :myset_foods do |t|
      t.bigint :myset_id, null: false, foreign_key: true
      t.bigint :food_id, foreign_key: true
      t.bigint :custom_id, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
