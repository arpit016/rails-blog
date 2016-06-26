class User < ActiveRecord::Base
  validates :username, presence: true, length: {minimum:3, maximum: 30}
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end