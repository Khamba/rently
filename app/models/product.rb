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

class Product < ActiveRecord::Base

  has_many :user_likes
  has_many :liked_by_users, through: :user_likes, source: :user
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images

  has_many :line_items
  has_many :orders, through: :line_items

  validates :name, presence: true
  validates :rent_price, numericality: { greater_than: 0, only_integer: true }
  validates :actual_price, numericality: { greater_than: 0, only_integer: true }

  def add_to_cart(order)
    order ||= Order.create!(ordered_by: current_user)
    self.line_items.create!(order: order, price: rent_price)
  end

end
