require 'rails_helper'

RSpec.describe 'Api::Orders', type: :request do
  let!(:orders) { load_data(Rails.application.credentials[:order_file_path]) }

  describe 'index' do
    describe 'GET /api/orders' do
      subject { get '/api/orders' }

      it 'should return all orders' do
        subject
        expect(response.status).to eq(200)
        expect(response.body).to eq(orders.to_json)
      end
    end
  end

  describe 'show' do
    describe 'GET /api/orders/:id' do
      let!(:order_index) { rand(0..(orders.length - 1)) }
      subject { get "/api/orders/#{orders[order_index]['id']}" }

      it 'should return all orders' do
        subject
        expect(response.status).to eq(200)
        expect(response.body).to eq(orders[order_index].to_json)
      end
    end
  end
end
