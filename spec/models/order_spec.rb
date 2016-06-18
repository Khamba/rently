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

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
