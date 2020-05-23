class DiseasesController < ApplicationController
  before_action :set_speciality
  before_action :set_speciality_disease, only: [:show, :update, :destroy]

  # GET /specialities/:speciality_id/diseases
  def index
    json_response(@speciality.diseases)
  end

  # GET /specialities/:speciality_id/diseases/:id
  def show
    json_response(@disease)
  end

  # POST /specialities/:speciality_id/diseases
  def create
    @speciality.diseases.create!(disease_params)
    json_response(@speciality, :created)
  end

  # PUT /specialities/:speciality_id/diseases/:id
  def update
    @disease.update(disease_params)
    head :no_content
  end

  # DELETE /specialities/:speciality_id/diseases/:id
  def destroy
    @disease.destroy
    head :no_content
  end

  private

  def disease_params
    params.permit(:name, :description, :prevention, :treatment)
  end

  def set_speciality
    @speciality = Speciality.find(params[:speciality_id])
  end

  def set_speciality_disease
    @disease = @speciality.diseases.find_by!(id: params[:id]) if @speciality
  end
end
