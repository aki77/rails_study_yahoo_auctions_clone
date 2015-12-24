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

require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
