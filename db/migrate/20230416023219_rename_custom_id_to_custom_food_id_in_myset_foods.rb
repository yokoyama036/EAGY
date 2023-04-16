class RenameCustomIdToCustomFoodIdInMysetFoods < ActiveRecord::Migration[6.1]
  def change
    rename_column :myset_foods, :custom_id, :custom_food_id
  end
end
