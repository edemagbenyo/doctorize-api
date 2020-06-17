# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :doctor
  belongs_to :appointment

  validates_presence_of :status
end
