module Api
  class OrdersController < ApplicationController
    before_action :load_order_data

    def index
      render json: @orders
    end

    def show
      render json: get_order(params[:id])
    end

    private

    def load_order_data
      @orders = load_data(Rails.application.credentials[:order_file_path])
    end

    def get_order(id)
      @orders.find { |order| order['id'] == id }
    end
  end
end
