FactoryGirl.define do
  factory :post do
    title { Faker::Company.name }
    description { Faker::Lorem.paragraph 4 }
    link 'http://www.google.com'
    ip_address '127.0.0.1'
    is_private false
  end

  trait :private do
    is_private true
  end
end
