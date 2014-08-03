FactoryGirl.define do
  factory :event do
    opens_at { Time.now }
  end
end
