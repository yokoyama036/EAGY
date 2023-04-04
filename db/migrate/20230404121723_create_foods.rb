class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name, :null => false
      t.integer :calorie, :null => false
      t.integer :protein, :null => false
      t.integer :carbo, :null => false
      t.integer :fat, :null => false
      t.integer :salt, :null => false
      t.string :unit, :null => false
      t.timestamps
    end
  end
end
