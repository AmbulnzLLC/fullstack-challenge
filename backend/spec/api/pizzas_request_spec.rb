require 'rails_helper'

RSpec.describe 'Api::Pizzas', type: :request do
  let!(:pizzas) { load_data(Rails.application.credentials[:pizza_file_path]) }

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

  describe 'show' do
    describe 'GET /api/pizzas/:id' do
      let!(:pizza_index) { rand(0..(pizzas.length - 1)) }
      subject { get "/api/pizzas/#{pizzas[pizza_index]['id']}" }

      it 'should return all pizzas' do
        subject
        expect(response.status).to eq(200)
        expect(response.body).to eq(pizzas[pizza_index].to_json)
      end
    end
  end
end
