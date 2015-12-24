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

class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: 'User'
  belongs_to :auction
  has_one :reviewee, through: :auction, source: :user

  enum rating: { good: 0, fair: 1, bad: 2 }

  validates :rating, presence: true
  validates :comment, presence: true
  validates :reviewer_id, presence: true
  validates :auction_id, presence: true, uniqueness: true
end
