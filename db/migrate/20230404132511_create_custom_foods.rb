class CreateCustomFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_foods do |t|
      t.string :name, null: false
      t.integer :calorie, null: false
      t.integer :protein, null: false
      t.integer :carbo, null: false
      t.integer :fat, null: false
      t.integer :salt, null: false
      t.string :unit, null: false
      t.bigint :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
