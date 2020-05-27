require 'rails_helper'

RSpec.describe Booking, type: :model do
  it{should belong_to(:doctor)}
  it{should belong_to(:appointment)}

  it{should validate_presence_of(:status)}
end
