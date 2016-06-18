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

class LineItem < ActiveRecord::Base

  belongs_to :product
  belongs_to :order
  has_one :ordered_by, through: :order

  validates :product, presence: true
  validates :order, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  validates :price, numericality: { greater_than: 0, only_integer: true }
  # TODO validate size

  def total
    quantity * price
  end

end
