# frozen_string_literal: true

class HealthinfosController < ApplicationController
  before_action :set_healthinfo, only: %i[index update destroy]
  def index
    json_response(@healthinfo)
  end

  def create
    # puts current_user.healthinfo
    @healthinfoppp = current_user.healthinfos.create(healthinfo_params)
    json_response(@healthinfo, :created)
  end

  def update
    @healthinfo.update(healthinfo_params)
    head :no_content
  end

  private

  def healthinfo_params
    params.permit(:id, :age, :gender, :weight, :height, :family, :personal)
  end

  def set_healthinfo
    @healthinfo = current_user.healthinfos
  end
end
