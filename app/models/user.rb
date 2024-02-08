class User < ApplicationRecord
    
  has_secure_password
  enum role: { user: 0, admin_user: 1 }
  validates :role, :email, :password, presence: true
  has_many :favorites, dependent: :destroy
  has_many :properties, dependent: :destroy

end	
