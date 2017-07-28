FactoryGirl.define do
  factory :user do
    login   "user"
    password "puser"
    role "user"

    factory :guest_user do
      role "guest"
    end

    factory :admin_user do
      role "admin"
    end
  end
end
