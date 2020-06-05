# app/controllers/users_controller.rb
class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :create_doctor]
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.username, user.password).call
    response = { message: Message.account_created, auth_token: auth_token, user: user }
    json_response(response, :created)
  end

  def create_doctor
    # puts user_params["experience_year"]
    user = User.create!({
                          :name => user_params["name"],
                          :username => user_params["username"],
                          :email => user_params["email"],
                          :password => user_params["password"]
                        })
    doctor = Doctor.create!({
                              :name => user_params["name"],
                              :hospital => user_params["hospital"],
                              :experience_year => user_params["experience_year"],
                              :user_id => user.id,
                              :speciality_id => user_params["speciality"],
                              :age => "0",
                              :city => user_params["city"]
                            })
    auth_token = AuthenticateUser.new(user.username, user.password).call
    response = { message: Message.account_created, auth_token: auth_token, user: user, doctor: doctor }
    json_response(response, :created)
  end

  def index
    json_response(current_user)
  end

  private

  def user_params
    params.permit(
      :name,
      :username,
      :email,
      :password,
      :password_confirmation,
      :experience_year,
      :hospital,
      :speciality,
      :city,
      :user
    )
  end
end
