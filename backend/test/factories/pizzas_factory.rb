FactoryBot.define do
  factory :pizza do
    name { Faker::Food.ingredient }
    price { 1.0 + rand * (10.0 - 1.0) }
    association :ingredients, factory: :ingredient, strategy: :build_list, size: (SecureRandom.random_number * 10).to_i
  end
end
