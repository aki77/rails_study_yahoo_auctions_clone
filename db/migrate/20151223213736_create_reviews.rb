class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id, null: false
      t.integer :auction_id, null: false
      t.integer :rating, null: false
      t.text :comment, null: false

      t.timestamps null: false

      t.index :reviewer_id
      t.index :auction_id, unique: true
    end
  end
end
