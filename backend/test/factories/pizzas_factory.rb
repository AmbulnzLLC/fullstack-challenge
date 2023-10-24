FactoryBot.define do
  sequence(:pizza_id_sequence) { |n| n.to_s }

  factory :pizza, class: Hash do
    id { generate(:pizza_id_sequence) }
    name { 'Margherita' }
    price { 5.00 }
    ingredients { %w[tomato mozzarella] }

    initialize_with { attributes }
  end
end
