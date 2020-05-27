class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :update, :destroy]

  def index
    @doctors = Doctor.all
    json_response(@doctors)
  end

  def create
    @doctor_new = Doctor.create!(doctor_params)
    json_response @doctor_new, :created
  end

  def show 
    json_response(@doctor)
  end
  private
    def doctor_params
      params.permit(:name, :age, :hospital, :experience_year, :user_id, :speciality_id, :city, :region, :country)
    end

    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

end
