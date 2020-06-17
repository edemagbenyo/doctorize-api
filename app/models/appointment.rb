# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates_presence_of :info, :meeting_link, :guest, :date, :time
end
