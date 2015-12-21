class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :user_id, null: false

      t.timestamps null: false

      t.index :user_id
    end
  end
end
