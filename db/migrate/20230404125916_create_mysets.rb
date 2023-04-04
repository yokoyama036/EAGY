class CreateMysets < ActiveRecord::Migration[6.1]
  def change
    create_table :mysets do |t|
      t.string :name, null: false
      t.bigint :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
