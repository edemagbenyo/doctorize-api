class Speciality < ApplicationRecord

  has_many :diseases, dependent: :destroy
  validates :name, presence: true
  validates :created_by, presence: true
end
