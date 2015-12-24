# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  auction_id :integer          not null
#  user_id    :integer          not null
#  value      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bids_on_auction_id_and_value  (auction_id,value) UNIQUE
#  index_bids_on_user_id               (user_id)
#

class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction, counter_cache: true

  default_scope -> { order('id desc') }

  STEP_VALUE = 100

  default_value_for :value do |bid|
    value = bid.auction.current_value
    value += STEP_VALUE if bid.auction.bids_count.nonzero?
    value
  end
end
