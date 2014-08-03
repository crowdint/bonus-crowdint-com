FactoryGirl.define do
  factory :award do
    association :user

    points 50
  end
end
