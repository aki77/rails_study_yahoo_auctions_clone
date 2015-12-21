class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.integer :value, null: false
      t.integer :product_id, null: false
      t.datetime :expired_at, null: false

      t.timestamps null: false

      t.index :product_id
      t.index :expired_at
    end
  end
end
