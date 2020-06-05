# frozen_string_literal: true

require 'rails_helper'
include RequestSpecHelper

RSpec.describe 'Specialities', type: :request do
  # initialize test data
  let(:user) { create(:user_with_specialities) }
  let(:specialities) { user.specialities }
  let(:speciality) { specialities.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /specialities
  describe 'GET /specialities' do
    # make HTTP get request before each example
    before { get '/specialities', params: {}, headers: headers }

    it 'returns specialities' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /specialities' do
    let(:valid_attributes) do
      # send json payload
      { name: 'Pediatric', description: 'Pedia for kids', created_by: user.name, user_id: user.id.to_s }.to_json
    end

    context 'when request is valid' do
      before { post '/specialities', params: valid_attributes, headers: headers }
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { name: nil }.to_json }
      before { post '/specialities', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end
end
