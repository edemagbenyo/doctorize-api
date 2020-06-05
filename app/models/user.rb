class User < ApplicationRecord
  has_secure_password
  has_many :specialities
  has_many :healthinfos
  has_many :appointments
  has_one :doctor
  has_many :favourite_doctors
  has_many :doctors , through: :favourite_doctors

  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
