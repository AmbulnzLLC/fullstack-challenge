module Api
  class PizzasController < ApplicationController
    def index
      pizzas = Pizza.includes(:ingredients).all
      render json: pizzas
    end
  end
end
