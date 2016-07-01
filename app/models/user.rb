class User < ActiveRecord::Base
  has_many :articles
  has_secure_password
  before_save { self.email = email.downcase }
  validates :username, presence: true, 
            length: {minimum:3, maximum: 30}, 
            uniqueness: { case_sensitive: false }

  validates :email, presence: true, 
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, 
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 }
end