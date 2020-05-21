# This will guess the User class
FactoryBot.define do
  factory :speciality do
    name { Faker::Lorem.word }
    description  { Faker::Lorem.sentence}
    created_by { Faker::Lorem.characters(number: 10) }
    
  end
end