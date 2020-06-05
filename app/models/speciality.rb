# frozen_string_literal: true

class Speciality < ApplicationRecord
  has_many :diseases, dependent: :destroy
  belongs_to :user
  has_many :doctors

  validates :name, presence: true
  validates :created_by, presence: true
end
