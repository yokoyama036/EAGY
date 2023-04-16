class AddNutritionGoalsToUserPhysicalInformations < ActiveRecord::Migration[6.1]
  def change
    add_column :user_physical_informations, :protein, :float
    add_column :user_physical_informations, :carbo, :float
    add_column :user_physical_informations, :fat, :float
    add_column :user_physical_informations, :salt, :float
  end
end
