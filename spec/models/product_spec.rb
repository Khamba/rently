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

require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
