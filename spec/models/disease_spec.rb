require 'rails_helper'

RSpec.describe Disease, type: :model do
  it {should belong_to(:speciality)}
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
