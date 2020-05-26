class User < ApplicationRecord
  has_secure_password
  has_many :specialities
  has_one :healthinfo
  has_one :doctor

  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
