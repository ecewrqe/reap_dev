FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    inventory_count { rand(1..100) }
    created_at { Time.now }
    updated_at { Time.now }

    trait :out_of_stock do
      inventory_count { 0 }
    end
  end
end
