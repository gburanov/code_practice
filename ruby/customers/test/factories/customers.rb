# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    birthday { (150 + rand(500)).months.ago }
  end

  factory :young_customer, :parent => :customer do
    birthday 50.months.ago
  end
end
