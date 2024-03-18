class User < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
