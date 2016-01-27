class Product < ActiveRecord::Base
  belongs_to :user
  has_many :auctions, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
