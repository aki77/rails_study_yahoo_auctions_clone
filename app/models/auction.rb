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

class Auction < ActiveRecord::Base
  belongs_to :product
  has_one :user, through: :product
  has_many :bids, dependent: :destroy

  delegate :name, to: :product, prefix: false
  delegate :description, to: :product, prefix: false

  scope :open, -> { where('expired_at > ?', Time.current).order('expired_at') }
  scope :closed, -> { where('expired_at <= ?', Time.current).order('expired_at desc') }

  def current_value
    [value, maximum_value.to_i].max
  end

  def maximum_value
    bids.maximum(:value)
  end

  def open?
    expired_at > Time.current
  end
end
