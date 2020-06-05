# This will guess the User class
FactoryBot.define do
  factory :healthinfo do
    age { "35" }
    gender { "male" }
    weight { "34.6" }
    height { "5.5" }
    family { Faker::Lorem.sentence }
    personal { Faker::Lorem.sentence }
    user
  end
end
