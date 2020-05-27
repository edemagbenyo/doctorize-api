require 'rails_helper'

RSpec.describe "Doctors", type: :request do

  let(:user){create(:user)}
  let(:speciality){create(:speciality, {:user_id=> user.id})}
  let(:user_doctor){create(:user_with_doctor)}
  let(:headers){valid_headers}
  describe "GET /doctors" do
    before{ get '/doctors', params: {}, headers: headers}
    context "with valid attributes" do
      it { expect(response).to have_http_status(200)}
    end
  end

  describe "POST /doctors" do
    context "with valid data" do
      let(:valid_params){{:name=>"Dr. Edem", :hospital=>"Clinic Julienne", :age=>"33", :experience_year=>"2", :user_id=>user.id, :speciality_id=>speciality.id, :city=>"Accra", :region=>"GA", :country=>"GHANA"}.to_json}
      before{post '/doctors', params: valid_params, headers: headers}
      it "return status 201 with valid attributes" do
        expect(response).to have_http_status(201)
      end

      it "contains the created doctor attributes" do
        expect(json).to include("name","experience_year","age","hospital")
      end

      it "matches the created doctor name" do
        expect(json["name"]).to eq("Dr. Edem")
      end

      it "matches the created doctor age" do
        expect(json["age"]).to eq("33")
      end
    end

    context "with invalid data" do
      let(:invalid_params){{:name=>nil, :hospital=>nil, :age=>"33", :experience_year=>"2"}.to_json}
      before{post '/doctors', params: invalid_params, headers: headers}
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "GET doctors/:id" do
    # let(doctor){user_doctor.doctor}
    before{ get "/doctors/#{user_doctor.doctor.id}", params: {}, headers: headers}

    it "return with status 200" do
      expect(response).to have_http_status(200)
    end
    it "returns an object with name" do 
      expect(json).to include("name")
    end
    it "returns an object with hospital" do 
      expect(json).to include("hospital")
    end
    it "returns an object with country" do 
      expect(json).to include("country")
    end
  end

  describe "PUT /doctors" do
    
  end

  describe "DELETE /doctors" do
  end

end
