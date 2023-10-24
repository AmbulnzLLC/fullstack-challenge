require 'rails_helper'

RSpec.describe 'Api::Pizzas', type: :request do
  let!(:pizza_one) { create(:pizza) }
  let!(:pizza_two) { create(:pizza) }

  describe 'show' do
    describe 'GET /api/pizzas' do
      subject { get '/api/pizzas' }

      it 'should return all pizzas' do
        byebug
        subject
        expect(response.status).to eq(200)
        expect(response.body).to eq(pizzas[pizza_index].to_json)
      end
    end
  end
end
