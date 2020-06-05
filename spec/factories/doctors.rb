# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    age { Random.new(100) }
    hospital { Faker::Name.name }
    experience_year { Random.new(10) }
    user
    speciality
    city { Faker::Address.city }
    region { Faker::Address.state }
    country { Faker::Address.country }
  end
end
