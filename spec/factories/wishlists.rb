# == Schema Information
#
# Table name: wishlists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :wishlist do
    user nil
    product nil
  end
end
