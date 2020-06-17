# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    user
    doctor
    info { Faker::Lorem.sentence }
    meeting_link { Faker::Lorem.sentence }
    guest { Faker::Name.name }
    date { Faker::Date.in_date_period }
    time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
