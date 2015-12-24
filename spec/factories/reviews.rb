# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  reviewer_id :integer          not null
#  auction_id  :integer          not null
#  rating      :integer          not null
#  comment     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_reviews_on_auction_id   (auction_id) UNIQUE
#  index_reviews_on_reviewer_id  (reviewer_id)
#

FactoryGirl.define do
  factory :review do
    reviewer_id 1
reviewee_id 1
rating ""
comment "MyText"
  end

end
