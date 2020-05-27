# This will guess the User class
FactoryBot.define do
  factory :speciality do
    name { Faker::Lorem.word }
    description  { Faker::Lorem.sentence}
    created_by { Faker::Lorem.characters(number: 10) }
    user

     factory :speciality_with_diseases do
       transient do
        speciality_count { 5 }
       end

        after(:create) do |speciality, evaluator|
          create_list(:disease, evaluator.speciality_count, speciality: speciality)
        end
      end
  end
end