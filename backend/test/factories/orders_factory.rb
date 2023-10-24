FactoryBot.define do
  factory :order do
    after(:create) do |order|
      pizzas = create_list(:pizza, (SecureRandom.random_number * 5).to_i)
      order.items << pizzas
      order.save!
    end
  end
end
