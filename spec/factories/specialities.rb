# This will guess the User class
FactoryBot.define do
  factory :speciality do
    name { Faker::Lorem.word }
    description  { Faker::Lorem.sentence}
    created_by { Faker::Lorem.characters(number: 10) }
    user

     # user_with_posts will create post data after the user has been created
     factory :speciality_with_diseases do
      # speciality_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        speciality_count { 5 }
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |speciality, evaluator|
        create_list(:disease, evaluator.speciality_count, speciality: speciality)
      end
    end
  end
end