class FavouritesController < ApplicationController


  def create 
    @created_favourite = FavouriteDoctor.create!(favourite_params)
    json_response(@created_favourite)
  end

  def users
    @user = User.find(params[:user_id])
  end

  def doctors
    @doc = User.find params[:user_id].to_i
    json_response(@doc.doctors)

  end

  private 
    def favourite_params
      params.permit(:user_id, :doctor_id)
    end
end
