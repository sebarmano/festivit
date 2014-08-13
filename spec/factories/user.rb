FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "fakeemail#{n}@fakesite.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :admin do
    sequence(:email) { |n| "adminemail#{n}@fakesite.com" }
    password 'password'
    password_confirmation 'password'
    type 'Admin'
  end

  factory :applicant do
    sequence(:email) { |n| "applicant#{n}@fakesite.com" }
    password 'password'
    password_confirmation 'password'
  end
end
