FactoryBot.define do
  factory :plan do
    name                   { '休日、holiday,ホリデー' }
    description            { Faker::Lorem.sentence }
    genre_id               { 1 }
    budget_id              { 2 }
    location_id            { 10 }
    expected_time_id       { 3 }
    association :user
    after(:build) do |plan|
      plan.images.attach(io: File.open('public/images/cat-6525495_1920.jpg'), filename: 'cat-6525495_1920.jpg')
    end
  end
end
