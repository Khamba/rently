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

require 'rails_helper'

RSpec.describe UserLike, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
