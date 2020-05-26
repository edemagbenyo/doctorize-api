class Booking < ApplicationRecord
  belongs_to :doctor
  belongs_to :appointment
end
