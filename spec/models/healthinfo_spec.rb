# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Healthinfo, type: :model do
  it { should belong_to(:user) }
end
