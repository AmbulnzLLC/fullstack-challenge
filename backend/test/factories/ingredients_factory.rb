FactoryBot.define do
  factory :ingredient do
    name { "#{Faker::Food.ingredient}#{SecureRandom.alphanumeric(8)}" }
  end
end
