class RemoveColumnsFromUserPhysicalInformations < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_physical_informations, :tall, :integer
    remove_column :user_physical_informations, :weight, :integer
    remove_column :user_physical_informations, :age, :integer
    remove_column :user_physical_informations, :active_level, :integer
  end
end
