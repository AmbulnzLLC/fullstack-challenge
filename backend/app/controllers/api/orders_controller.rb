module Api
  class OrdersController < ApplicationController
    def index
      orders = Order.includes(order_items: :item).all
      render json: orders.as_json(
        methods: [:items_with_quantities]
      )
    end

    def show
      order = Order.includes(order_items: :item).find(params[:id])
      render json: order.as_json(
        methods: [:items_with_quantities]
      )
    end
  end
end
