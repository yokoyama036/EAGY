class ChangeCustomFoodsDataTypeToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :custom_foods, :calorie, :float
    change_column :custom_foods, :protein, :float
    change_column :custom_foods, :carbo, :float
    change_column :custom_foods, :fat, :float
    change_column :custom_foods, :salt, :float
  end
end
