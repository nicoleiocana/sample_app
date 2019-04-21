class User < ApplicationRecord
  before_save { email.downcase! }
  
  validates :name, presence: true, length: { maximum: 50}
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  
  has_secure_password              
end
