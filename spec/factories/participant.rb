FactoryGirl.define do
  factory :participant do
    fname 'Bandy'
    lname 'Banderson'

    factory :participant_complete do
      street_address '123 Fake St.'
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
end
