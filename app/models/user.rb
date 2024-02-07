class User < ApplicationRecord
	has_secure_password
  enum role: { user: 0, admin_user: 1 }
  validates :role, presence: true 

  has_many :favorites, dependent: :destroy
  has_many :properties, dependent: :destroy
  #has_many :favorited_properties, through: :favorites, source: :property
end	
