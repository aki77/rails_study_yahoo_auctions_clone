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

FactoryGirl.define do
  factory :product do
    name "MyString"
description "MyText"
user_id 1
  end

end
