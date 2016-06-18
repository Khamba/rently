# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string
#  rent_price   :integer
#  actual_price :integer
#  details      :text
#  description  :text
#  popularity   :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :product do
    name "MyString"
    rent_price 1
    actual_price 1
    details "MyText"
    description "MyText"
  end
end
