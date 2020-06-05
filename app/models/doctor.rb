class Doctor < ApplicationRecord
  belongs_to :speciality
  belongs_to :user
  has_many :appointments
  has_many :patients , through: :appointment, class_name: 'User'

  has_many :favourite_patients, through: :favourite_doctors, class_name: 'User'

  validates :name, presence: true
  validates_presence_of :hospital, :age, :experience_year
end
