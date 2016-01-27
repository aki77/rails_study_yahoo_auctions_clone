class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_USERNAME_REGEX = /\A[a-z]\w*[a-z0-9]\z/i
  validates :username, presence: true,
                       format: { with: VALID_USERNAME_REGEX },
                       uniqueness: { case_sensitive: false },
                       length: { maximum: 15 }

  has_many :products, dependent: :destroy
  has_many :bids, dependent: :destroy

  def reviews
    Review.joins(auction: :product).where('products.user_id = ?', self).order('reviews.id desc')
  end
end
