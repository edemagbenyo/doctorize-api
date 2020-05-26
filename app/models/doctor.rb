class Doctor < ApplicationRecord
  belongs_to :speciality
  belongs_to :user
  validates :name, presence: true
  validates_presence_of :hospital, :age, :experience_year
end
