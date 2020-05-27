require 'rails_helper'

RSpec.describe FavouriteDoctor, type: :model do
  it{should belong_to(:user)}
  it{should belong_to(:doctor)}

  # it{ should validate_presence_of(:user)}
end
