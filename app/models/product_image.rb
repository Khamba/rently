# == Schema Information
#
# Table name: product_images
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#

class ProductImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :product
end
