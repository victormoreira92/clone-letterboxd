FactoryBot.define do
  factory :watchlist_movie do
    association :watchlist
    association :movie
  end
end
