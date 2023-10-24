class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items

  before_save :compute_total

  def items_with_quantities
    self.order_items.includes(:item).map do |order_item|
      {
        name: order_item.item.name,
        quantity: order_item.quantity,
        price: order_item.item.price
      }
    end
  end

  private

  def compute_total
    self.total = order_items.includes(:item).sum { |oi| oi.item.price * oi.quantity }
  end
end
