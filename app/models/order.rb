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

class Order < ActiveRecord::Base

  has_many :line_items, after_add: :update_total, after_remove: :update_total
  has_many :products, through: :line_items
  belongs_to :ordered_by, polymorphic: true

  validates :total, numericality: { greater_than: 0, only_integer: true }
  validates :ordered_by, presence: true

  enum status: {
    cart: 0,
    paid: 1
  }

  def has_product?(product_id, size)
    LineItem.where(order: self).where(product_id: product_id).where(size: size).count != 0
  end

  def add_to_cart(product_id, size)
    unless self.has_product?(product_id, size)
      product = Product.find(product_id)
      self.line_items.create!(product: product, price: rent_price)
    end
  end

  def remove_from_cart(product_id, size)
    LineItem.where(order: self).where(product_id: product_id).where(size: size).destroy_all
  end

  private

    def update_total
      self.update_attributes(total: self.line_items.sum(:total))
    end

end
