class Disease < ApplicationRecord
  belongs_to :speciality

  validates :name, presence: true
end
