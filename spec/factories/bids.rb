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

FactoryGirl.define do
  factory :bid do
    auction_id 1
user_id 1
value 1
  end

end
