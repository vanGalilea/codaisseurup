FactoryGirl.define do
  factory :event do
    name              { Faker::Lorem.sentence(1) }
    description       { Faker::Lorem.sentence(40) }
    location          { Faker::Address.city }
    price             { Faker::Commerce.price }
    includes_food     true
    includes_drinks   true
    capacity          50
    starts_at         Time.now
    ends_at           Time.now
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
