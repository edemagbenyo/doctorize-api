require 'rails_helper'

RSpec.describe "Favourites", type: :request do
  let(:user){ create(:user_with_doctor) }
  let(:user2){ create(:user_with_doctor) }
  let(:headers){ valid_headers }
  describe "POST /favourites" do
  
    context "when the request is valid" do
      let(:valid_params){ {user_id: user.id, doctor_id: user.doctor.id}.to_json }
      before { post "/favourites", params: valid_params, headers: headers }

      it "returns with status code 200" do
        expect(response).to have_http_status(200)
      end
    end
    context "when the request is invalid" do
      let(:valid_params){ {user_id: nil, doctor_id: nil}.to_json }
      before { post "/favourites", params: valid_params, headers: headers }

      it "returns with status code 422" do
        expect(response).to have_http_status(422)
      end
    end


  end
  describe "GET /favourites/:userid" do
    let!(:favourite) { create(:favourite_doctor,{user_id: user.id, doctor_id: user.doctor.id}) }
    let!(:favourite2) { create(:favourite_doctor,{user_id: user.id, doctor_id: user2.doctor.id}) }

    before { get "/favourites/#{user.id}/doctors", params:{}, headers: headers }

    it "return with status 200" do 
      expect(response).to have_http_status(200)
    end
    it "return the list of favourites doctors" do 
      expect(json.count).to eq(2)
    end
  end

end
