class Speciality < ApplicationRecord

  has_many :diseases, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :created_by, presence: true
end
