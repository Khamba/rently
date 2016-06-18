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

require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
