require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it{ should belong_to(:user)}
  it{ should validate_presence_of(:name)}
  it{ should validate_presence_of(:hospital)}
  it{ should validate_presence_of(:age)}
  it{ should validate_presence_of(:experience_year)}
end