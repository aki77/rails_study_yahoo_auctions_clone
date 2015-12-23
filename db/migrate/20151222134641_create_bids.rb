class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :auction_id, null: false
      t.integer :user_id, null: false
      t.integer :value, null: false

      t.timestamps null: false

      t.index %i(auction_id value), unique: true
      t.index :user_id
    end
  end
end
