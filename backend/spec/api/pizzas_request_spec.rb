require 'rails_helper'

RSpec.describe 'Api::Pizzas', type: :request do
  let!(:pizzas) do
    [
      build(:pizza, name: 'Margherita', price: 5.00, ingredients: %w[tomato mozzarella]),
      build(:pizza, name: 'Marinara', price: 4.00, ingredients: %w[tomato garlic]),
      build(:pizza, name: 'Salami', price: 6.00, ingredients: %w[tomato mozzarella salami]),
      build(:pizza, name: 'Prosciutto', price: 7.00, ingredients: %w[tomato mozzarella prosciutto]),
      build(:pizza, name: 'Diavola', price: 6.50, ingredients: ['tomato', 'mozzarella', 'salami', 'hot peppers'])
    ]
  end

  before do
    File.open(Rails.application.credentials[:pizza_file_path], 'w') do |file|
      file.write(pizzas.to_json)
    end
  end

  after do
    if File.exist?(Rails.application.credentials[:pizza_file_path])
      File.delete(Rails.application.credentials[:pizza_file_path])
    end
  end

  describe 'index' do
    describe 'GET /api/pizzas' do
      subject { get '/api/pizzas' }

      it 'should return all pizzas' do
        subject
        expect(response.status).to eq(200)
        expect(response.body).to eq(pizzas.to_json)
      end
    end
  end
end
