# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :guest do
    token "MyString"
  end
end
