# == Schema Information
#
# Table name: user_likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  user_type  :string
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user_like do
    user nil
    product nil
  end
end
