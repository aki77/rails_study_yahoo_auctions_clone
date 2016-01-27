# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#

class Product < ActiveRecord::Base
  belongs_to :user
  has_many :auctions, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
