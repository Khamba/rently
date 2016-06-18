# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#

FactoryGirl.define do
  factory :product_image do
    image "MyString"
  end
end
