FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '1234567' }
    password_confirmation { '1234567' }
  end

  trait :without_email do
    email { nil }
  end

  trait :without_password do
    password { nil }
  end

  trait :without_password_confirmation do
    password_confirmation { nil }
  end
end
