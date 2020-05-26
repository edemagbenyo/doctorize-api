require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it{ should belong_to(:user)}
  it{ should belong_to(:doctor)}
  it{ should validate_presence_of(:info)}
  it{ should validate_presence_of(:meeting_link)}
  it{ should validate_presence_of(:guest)}
  it{ should validate_presence_of(:date)}
  it{ should validate_presence_of(:time)}
end
