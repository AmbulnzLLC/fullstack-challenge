require 'rails_helper'

RSpec.describe 'Api::Orders', type: :request do
  let!(:orders) { create_list(:order, (SecureRandom.random_number * 5).to_i) }
  let!(:order) { orders.first }

  describe 'index' do
    describe 'GET /api/orders' do
      subject { get '/api/orders' }

      it 'should return all orders' do
        subject
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body).count).to eq(orders.count)
      end
    end
  end

  describe 'show' do
    describe 'GET /api/orders/:id' do
      subject { get "/api/orders/#{order.id}" }

      it 'should return all orders' do
        subject
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)['id']).to eq(order['id'])
        expect(JSON.parse(response.body)['items_with_quantities'].first['name']).to eq(order.items.first.name)
      end
    end
  end
end
