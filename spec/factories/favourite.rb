# This will guess the User class
FactoryBot.define do
  factory :favourite_doctor do
    user
    doctor
  end
end
