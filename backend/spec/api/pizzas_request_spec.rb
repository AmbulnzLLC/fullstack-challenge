require 'rails_helper'

RSpec.describe 'Api::Pizzas', type: :request do
  let!(:pizzas) { create_list(:pizza, (SecureRandom.random_number * 5).to_i) }

  describe 'show' do
    describe 'GET /api/pizzas' do
      subject { get '/api/pizzas' }

      it 'should return all pizzas' do
        subject
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).count).to eq(pizzas.count)
      end
    end
  end
end
