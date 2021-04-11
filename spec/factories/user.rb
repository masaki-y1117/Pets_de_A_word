FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name {Faker::Name.name}
    password { 'password' }
    password_confirmation { 'password' }
    introduction { Faker::Lorem.characters(number: 20) }
  end
end