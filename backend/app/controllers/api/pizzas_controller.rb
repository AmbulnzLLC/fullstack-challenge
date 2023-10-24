module Api
  class PizzasController < ApplicationController
    before_action :load_pizza_data

    def index
      render json: @pizzas
    end

    def show
      render json: get_pizza(params[:id])
    end

    private

    def load_pizza_data
      @pizzas = load_data(Rails.application.credentials[:pizza_file_path])
    end

    def get_pizza(id)
      @pizzas.find { |pizza| pizza['id'] == id }
    end
  end
end
