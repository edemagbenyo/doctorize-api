class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
    json_response(@doctors)
  end

  def create
    @doctor = Doctor.create!(doctor_params)
    json_response @doctor, :created
  end

  private
    def doctor_params
      params.permit(:name, :age, :hospital, :experience_year, :user_id, :speciality_id)
    end

end
