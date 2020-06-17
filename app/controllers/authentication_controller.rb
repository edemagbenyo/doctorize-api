# frozen_string_literal: true

# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request # , only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:username], auth_params[:password]).call
    user = User.find_by(username: auth_params[:username])
    doctor = user.doctor
    json_response(auth_token: auth_token, user: user, doctor: doctor)
  end

  private

  def auth_params
    params.permit(:username, :password)
  end
end
