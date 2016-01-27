class Auction < ActiveRecord::Base
  belongs_to :product
  has_one :user, through: :product
  has_one :review, dependent: :destroy
  has_many :bids, dependent: :destroy

  delegate :name, to: :product, prefix: false
  delegate :description, to: :product, prefix: false
  delegate :user, to: :product, prefix: false

  scope :open, -> { where('expired_at > ?', Time.current).order('expired_at') }
  scope :closed, -> { where('expired_at <= ?', Time.current).order('expired_at desc') }

  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 1 },
                    presence: true
  validates :expired_at, presence: true, date: { after: proc { Time.current + 10.minute } }

  default_value_for :expired_at do
    Time.current + 1.hour
  end

  def current_value
    [value, maximum_value.to_i].max
  end

  def maximum_value
    bids.maximum(:value)
  end

  def allow_bid_value
    has_bids? ? maximum_value + 1 : value
  end

  def open?
    expired_at > Time.current
  end

  def closed?
    !open?
  end

  def has_bids?
    bids_count > 0
  end

  def successful_bid?
    closed? && has_bids?
  end

  def successful_bid
    return nil if open? || bids_count.zero?
    bids.order('value desc').first
  end

  def successful_bidder
    successful_bid.try(:user)
  end
end
