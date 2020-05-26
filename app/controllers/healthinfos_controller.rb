class HealthinfosController < ApplicationController
  before_action :set_healthinfo, only: [:index, :update, :destroy]

  def index
    json_response(@healthinfo)
  end
  def create
    @healthinfo = Healthinfo.create!(healthinfo_params)
    json_response(@healthinfo, :created)
  end

  def update
    @healthinfo.update(healthinfo_params)
    head :no_content
  end

  private
    def healthinfo_params
      params.permit(:age, :gender, :weight, :height, :family, :personal, :user_id)
    end
    def set_healthinfo
      @healthinfo = current_user.healthinfo
    end
end
