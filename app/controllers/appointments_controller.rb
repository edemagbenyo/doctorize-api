class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [ :update, :destroy]

  def index
    doctor = current_user.doctor
    if doctor
      
      render json: doctor.appointments, include: :user
    else
      render json: current_user.appointments, include: :doctor
    end
  end
  def create
    @new_appoint = Appointment.create!(appointment_params)

    json_response(@new_appoint)
  end

  private
    def appointment_params
      params.permit(:meeting_link, :info, :guest, :date, :doctorid, :userid, :id,:date,:time, :doctor_id, :user_id)
    end
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
end
