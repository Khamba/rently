# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  quantity   :integer          default(1), not null
#  size       :string           not null
#  order_id   :integer
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :line_item do
    product nil
    quantity 1
    size "MyString"
    order nil
  end
end
