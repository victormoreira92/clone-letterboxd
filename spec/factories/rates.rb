FactoryBot.define do
  factory :rate do
    stars { 1 }
    movie { nil }
    user { nil }
    review { "MyText" }
  end
end
