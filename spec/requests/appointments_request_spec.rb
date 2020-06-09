# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
   # initialize test data
   let(:user) { create(:user_with_appointments) }
   let(:appointments){user.appointments}
   let(:headers) { valid_headers }

   describe 'GET /appointments' do
      context 'when user has appointents' do
         before { get "/appointments", params: {}, headers: headers }
         it 'return with status code 200' do
            expect(response).to have_http_status(200)
         end

         it 'return the list of appointments' do
            expect(json.size).to eq(5) 
         end
     end
     
     context 'when user has no appointment' do
      let(:user) { create(:user) }
      before { get "/appointments", params: {}, headers: headers }
         it 'return with status code 200' do
            expect(response).to have_http_status(200)
         end

         it 'return with an emtpy array' do 
            expect(json.size).to eq(0) 
         end
     end
   end
end
