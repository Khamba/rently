# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  total           :integer          default(0), not null
#  ordered_by_id   :integer
#  ordered_by_type :string
#  status          :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :order do
    total 1
  end
end
