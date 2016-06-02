require 'faker'

FactoryGirl.define do
  factory :user do
    username     { Faker::Name.name }
    email        { Faker::Internet.safe_email }
    password     { Faker::Internet.password }
  end

end
