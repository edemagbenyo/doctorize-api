require 'rails_helper'
include RequestSpecHelper

RSpec.describe "Diseases", type: :request do
  # Initialize the test data
  let!(:speciality) { create(:speciality) }
  let!(:diseases) { create_list(:disease, 20, speciality_id: speciality.id) }
  let(:speciality_id) { speciality.id }
  let(:id) { disease.first.id }

  # Test suite for GET /specialities/:speciality_id/disease
  describe 'GET /specialities/:speciality_id/disease' do
    before { get "/specialities/#{speciality_id}/diseases" }

    context 'when speciality exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all speciality disease' do
        expect(json.size).to eq(20)
      end
    end

    context 'when speciality does not exist' do
      let(:speciality_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Speciality/)
      end
    end
  end

  # Test suite for GET /specialities/:speciality_id/disease/:id
  describe 'GET /specialities/:speciality_id/disease/:id' do
    before { get "/specialities/#{speciality_id}/disease/#{id}" }

    context 'when speciality disease exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the disease' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when speciality disease does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Disease/)
      end
    end
  end

  # Test suite for PUT /specialities/:speciality_id/disease
  describe 'POST /specialities/:speciality_id/disease' do
    let(:valid_attributes) { { name: 'Visit Narnia', done: false } }

    context 'when request attributes are valid' do
      before { post "/specialities/#{speciality_id}/disease", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/specialities/#{speciality_id}/disease", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /specialities/:speciality_id/disease/:id
  describe 'PUT /specialities/:speciality_id/disease/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/specialities/#{speciality_id}/disease/#{id}", params: valid_attributes }

    context 'when disease exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the disease' do
        updated_disease = Disease.find(id)
        expect(updated_disease.name).to match(/Mozart/)
      end
    end

    context 'when the disease does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Disease/)
      end
    end
  end

  # Test suite for DELETE /specialities/:id
  describe 'DELETE /specialities/:id' do
    before { delete "/specialities/#{speciality_id}/disease/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

