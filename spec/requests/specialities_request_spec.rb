require 'rails_helper'
include RequestSpecHelper


RSpec.describe "Specialities", type: :request do
  # initialize test data 
  let!(:specialities) { create_list(:speciality, 5) }
  let(:speciality) { specialities.first.id }

  # Test suite for GET /specialities
  describe 'GET /specialities' do
    # make HTTP get request before each example
    before { get '/specialities' }

    it 'returns specialities' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
