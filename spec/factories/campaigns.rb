require 'faker'

FactoryBot.define do
  factory :campaign do
    name { Faker::Fantasy::Tolkien.location }
    next_session { Faker::Date.forward(from: Date.current, days: 60) }

    association :dm, factory: :user
  end
end