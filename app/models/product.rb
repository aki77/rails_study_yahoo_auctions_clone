class Product < ActiveRecord::Base
  belongs_to :user
  has_many :auctions, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
