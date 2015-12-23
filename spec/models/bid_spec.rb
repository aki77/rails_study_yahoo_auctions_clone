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

require 'rails_helper'

RSpec.describe Bid, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
