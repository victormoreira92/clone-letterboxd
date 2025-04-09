FactoryBot.define do
  factory :rate do
    stars { 1 }
    review { Faker::Lorem.paragraph_by_chars }
    spoiler { false }
    association :user
    association :movie
  end
end
