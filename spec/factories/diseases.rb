# This will guess the User class
FactoryBot.define do
  factory :disease do
    name { Faker::Lorem.word }
    description  { Faker::Lorem.sentence}
    prevention { Faker::Lorem.sentence }
    treatment { Faker::Lorem.sentence }
    speciality
  end
end