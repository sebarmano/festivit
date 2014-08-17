FactoryGirl.define do
  factory :performer, class: Submission do
    group_name 'The Best Band Ever'
    bio 'This is an example bio.'
    website 'www.thebestbandever.com'
    city 'Durham'
    state 'NC'
    zip '27701'
    country 'USA'
    phone '1111111111'
    sequence(:email) { |n| "participant#{n}@fakesite.com" }
    twitter_link 'twitter'
    facebook_link 'facebook'
  end
end