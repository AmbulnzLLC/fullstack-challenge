FactoryBot.define do
  factory :pizza do
    name { Faker::Food.ingredient }
    price { 1.0 + rand * (10.0 - 1.0) }

    after(:create) do |pizza|
      ingredients = create_list(:ingredient, (SecureRandom.random_number * 5).to_i)
      pizza.ingredients << ingredients
      pizza.save!
    end
  end
end
