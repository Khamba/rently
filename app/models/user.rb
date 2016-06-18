# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :user_likes, as: :user
  has_many :liked_products, through: :user_likes, source: :product

  has_many :wishlisted_products, class_name: 'Wishlist'
  has_many :wishlist_products, through: :wishlisted_products, source: :product

  has_many :orders, as: :ordered_by, dependent: :destroy


  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data["name"],
           email: data["email"],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

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

  def wishlisted_product?(product)
    return self.wishlisted_products.where(product: product).count > 0
  end

  def toggle_from_wishlist(product)
    if self.wishlisted_product?(product)
      self.remove_from_wishlist(product)
    else
      self.add_to_wishlist(product)
    end
  end

  def add_to_wishlist(product)
    self.wishlisted_products.create!(product: product)
  end

  def remove_from_wishlist(product)
    self.wishlisted_products.where(product: product).destroy_all
  end

end
