class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :auction, counter_cache: true

  validates :auction_id, presence: true
  validates :user_id, presence: true
  validates :value, numericality: { only_integer: true,
                                    greater_than_or_equal_to: ->(bid) { bid.auction.allow_bid_value } },
                    presence: true

  STEP_VALUE = 100

  default_value_for :value do |bid|
    value = bid.auction.current_value
    value += STEP_VALUE if bid.auction.bids_count.nonzero?
    value
  end
end
