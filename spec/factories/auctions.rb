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
#  bids_count :integer          default(0), not null
#
# Indexes
#
#  index_auctions_on_expired_at  (expired_at)
#  index_auctions_on_product_id  (product_id)
#

FactoryGirl.define do
  factory :auction do
    value 1
product_id 1
expired_at "2015-12-21 16:49:53"
  end

end
