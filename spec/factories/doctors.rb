# This will guess the User class
FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    age  { Random.new(100)}
    hospital { Faker::Name.name }
    experience_year {Random.new(10)}
    user
    speciality_id { 1 }
  end
end