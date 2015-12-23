class AddBidsCountToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :bids_count, :integer, null: false, default: 0
  end
end
