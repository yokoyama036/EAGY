class CreateUserPhysicalInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_physical_informations do |t|
      t.string :name
      t.integer :tall, null: false
      t.integer :weight, null: false
      t.integer :age, null: false
      t.integer :active_level
      t.integer :metabolism
      t.bigint :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
