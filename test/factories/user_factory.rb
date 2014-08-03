FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@example.com"
    end

    password              "test1234"
    password_confirmation "test1234"

    factory :admin_user do
      is_admin true
    end
  end
end
