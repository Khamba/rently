# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Guest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
