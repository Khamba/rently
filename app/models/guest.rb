# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Guest < ActiveRecord::Base

  has_many :orders, as: :ordered_by, dependent: :destroy
  has_many :user_likes, as: :user
  has_many :liked_products, through: :user_likes, source: :product
  
  before_create :generate_token

  def likes?(product)
    return self.user_likes.where(product: product).count > 0
  end

  def toggle_like(product)
    if self.likes?(product)
      self.unlike(product)
    else
      self.like(product)
    end
  end

  def like(product)
    self.user_likes.create!(product: product)
  end

  def unlike(product)
    self.user_likes.where(product: product).destroy_all
  end

  private

    def generate_token
      self.token = SecureRandom.base58(24)
    end

end
