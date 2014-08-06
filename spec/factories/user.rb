FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "fakeemail#{n}@fakesite.com" }
    password 'password'
    password_confirmation 'password'
  end
end
