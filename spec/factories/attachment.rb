FactoryGirl.define do
  factory :photo, class: attachment do
    title "Bandy's photo"
    file { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'), 'image/png') }
  end

  factory :video, class: attachment do
    title "Bandy's video"
    link "https://www.youtube.com/watch?v=OVQgDaTQK2M&list=UU9YLd0REiXxLqQQH_CpJKZQ"
  end

  factory :song, class: attachment do
    title "Bandy's song"
    song 
  end

end
