# frozen_string_literal: true

# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    username { Faker::Name.first_name }
    image { Faker::Placeholdit.image }
    password { 'foobar' }

    factory :user_with_specialities do
      transient do
        speciality_count { 5 }
      end
      after(:create) do |user, evaluator|
        create_list(:speciality, evaluator.speciality_count, user: user)
      end
    end

    factory :user_with_doctor do
      after(:create) do |user, _evaluator|
        create(:doctor, user: user)
      end
    end

    factory :user_with_healthinfo do
      after(:create) do |user, _evaluator|
        create(:healthinfo, user: user)
      end
    end

    factory :user_with_appointments do

      after(:create) do |user,evaluator|
        create_list(:appointment,5, user: user)
      end
      
    end
  end
end
