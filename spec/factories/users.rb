# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email {"foo@bar.com"}
    username {"foo"}
    password {"foobar"}
  end
end