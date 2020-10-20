class User < ApplicationRecord
  has_secure_password
  validates :name, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true

  has_many :recipes
end
