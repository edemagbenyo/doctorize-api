class SpecialitiesController < ApplicationController
  before_action :set_speciality, only: [:show, :update, :destroy, :doctors]
  skip_before_action :authorize_request, only: [:index, :show]
  # GET /specialities
  def index
    @specialities = Speciality.all
    json_response(@specialities)
  end

  # POST /specialities
  def create
    @speciality = current_user.specialities.create!(speciality_params)
    json_response(@speciality, :created)
  end

  # GET /specialities/:id
  def show
    render :json=>@speciality, include: :doctors
  end

  # PUT /specialities/:id
  def update
    @speciality.update(speciality_params)
    head :no_content
  end

  # DELETE /specialities/:id
  def destroy
    @speciality.destroy
    head :no_content
  end


  private

  def speciality_params
    # whitelist params
    params.permit(:name, :description, :created_by)
  end

  def set_speciality
    @speciality = Speciality.find(params[:id])
  end
end
