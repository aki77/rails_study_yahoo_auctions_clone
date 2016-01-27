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
