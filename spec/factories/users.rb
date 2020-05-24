# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email {"foo@bar.com"}
    username {"foo"}
    password {"foobar"}

    factory :user_with_specialities do
      transient do
        speciality_count { 5 }
      end
      after(:create) do |user, evaluator|
        create_list(:speciality, evaluator.speciality_count, user: user)
      end
    end

    factory :user_with_healthinfo do
      after(:create) do |user, evaluator|
        create(:healthinfo, user: user)
      end
    end
  end
   

    
end