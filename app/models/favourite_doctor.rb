class FavouriteDoctor < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  # validates_presence_of :user_id, :doctor_id
end
