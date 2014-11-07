FactoryGirl.define do
  factory :post do
    title { Faker::Company.name }
    description { Faker::Lorem.paragraph 4 }
    link "http://www.google.com"
    slug { Faker::Internet.slug }
    ip_address "127.0.0.1"
    is_private false
    deleted false
  end

  trait :private do
    is_private true
  end

  trait :deleted do
    deleted true
  end
end
