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

class UserLike < ActiveRecord::Base
  belongs_to :user, polymorphic: true
  belongs_to :product

  validates_presence_of :user
  validates_presence_of :product
end
