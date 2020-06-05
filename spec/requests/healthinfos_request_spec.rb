require 'rails_helper'

RSpec.describe "Healthinfos", type: :request do
  let(:user) { create(:user_with_healthinfo) }
  let(:user_id) { user.id }
  let(:healthinfo) { user.healthinfo }
  let(:headers) { valid_headers }

  describe 'GET /users/:id/healthinfos' do
    context 'when healthinfo exists' do
      before { get "/users/#{user_id}/healthinfos", params: {}, headers: headers }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns heathinfo information' do
        expect(json).to include("age", "gender", "family", "personal", "user_id")
      end
    end
    context 'when healthinfo do no exists' do
      let(:user) { create(:user) }
      before { get "/users/#{user_id}/healthinfos", params: {}, headers: headers }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns empty {} heathinfo information' do
        # puts json
        expect(json).to be_nil
      end
    end
  end

  describe 'POST /users/:id/healthinfos' do
    context 'when healthinfo is valid' do
      let(:user) { create(:user) }
      let(:valid_params) { { age: "23", gender: "male", family: "fadf", personal: "personal", user_id: user.id }.to_json }
      before { post "/users/#{user.id}/healthinfos", params: valid_params, headers: headers }
      it 'returns status code :created(201)' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
