class PizzaIngredient < ApplicationRecord
  belongs_to :item
  belongs_to :ingredient
end
