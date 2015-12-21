# == Schema Information
#
# Table name: auctions
#
#  id         :integer          not null, primary key
#  value      :integer          not null
#  product_id :integer          not null
#  expired_at :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_auctions_on_expired_at  (expired_at)
#  index_auctions_on_product_id  (product_id)
#

require 'rails_helper'

RSpec.describe Auction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
