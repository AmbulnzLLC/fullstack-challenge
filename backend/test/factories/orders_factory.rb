FactoryBot.define do
  factory :order do
    association :items, factory: :pizza, strategy: :build_list, size: (SecureRandom.random_number * 10).to_i
  end
end
