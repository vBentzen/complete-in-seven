FactoryBot.define do
  pw = Faker::Internet.password(10, 20)
  factory :user do
      sequence(:email){|n| "user#{n}@factory.com" }
      password pw
      password_confirmation pw
      confirmed_at Time.now
  end
end
