FactoryGirl.define do
  factory :author do
    name   "Author"
    biography "Biography"
    association :creator, factory: :user
  end
end
