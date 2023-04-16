class ChangeFoodsDataTypeToFloat < ActiveRecord::Migration[6.1]
  def change
      change_column :foods, :calorie, :float
      change_column :foods, :protein, :float
      change_column :foods, :carbo, :float
      change_column :foods, :fat, :float
      change_column :foods, :salt, :float
  end
end
