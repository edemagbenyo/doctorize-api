# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email {"foo@bar.com"}
    username {"foo"}
    password {"foobar"}

    # user_with_posts will create post data after the user has been created
    factory :user_with_specialities do
      # speciality_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        speciality_count { 5 }
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |user, evaluator|
        create_list(:speciality, evaluator.speciality_count, user: user)
      end
    end
  end
   

    
end