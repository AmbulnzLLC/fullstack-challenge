# Seeding Ingredients
ingredient_tomato = Ingredient.find_or_create_by!(name: 'tomato')
ingredient_mozzarella = Ingredient.find_or_create_by!(name: 'mozzarella')
ingredient_mozarella_di_bufala = Ingredient.find_or_create_by!(name: 'mozzarella di bufala')
ingredient_anchovy = Ingredient.find_or_create_by!(name: 'anchovy')
ingredient_oregano = Ingredient.find_or_create_by!(name: 'oregano')
ingredient_oil = Ingredient.find_or_create_by!(name: 'oil')
ingredient_spicy_salami = Ingredient.find_or_create_by!(name: 'spicy salami')

# Seeding Pizzas
pizza_margherita = Pizza.find_or_create_by!(
  name: 'Margherita',
  price: 5.00
)

pizza_margherita.ingredients << ingredient_tomato unless pizza_margherita.ingredients.include?(ingredient_tomato)
pizza_margherita.ingredients << ingredient_mozzarella unless pizza_margherita.ingredients.include?(ingredient_mozzarella)

pizza_bufala = Pizza.find_or_create_by!(
  name: 'Bufala',
  price: 6.00
)

pizza_bufala.ingredients << ingredient_tomato unless pizza_bufala.ingredients.include?(ingredient_tomato)
pizza_bufala.ingredients << ingredient_mozarella_di_bufala unless pizza_bufala.ingredients.include?(ingredient_mozarella_di_bufala)

pizza_romana = Pizza.find_or_create_by!(
  name: 'Romana',
  price: 5.00
)

pizza_romana.ingredients << ingredient_tomato unless pizza_romana.ingredients.include?(ingredient_tomato)
pizza_romana.ingredients << ingredient_mozzarella unless pizza_romana.ingredients.include?(ingredient_mozzarella)
pizza_romana.ingredients << ingredient_anchovy unless pizza_romana.ingredients.include?(ingredient_anchovy)
pizza_romana.ingredients << ingredient_oregano unless pizza_romana.ingredients.include?(ingredient_oregano)
pizza_romana.ingredients << ingredient_oil unless pizza_romana.ingredients.include?(ingredient_oil)

pizza_diavola = Pizza.find_or_create_by!(
  name: 'Diavola',
  price: 7.50
)

pizza_diavola.ingredients << ingredient_tomato unless pizza_diavola.ingredients.include?(ingredient_tomato)
pizza_diavola.ingredients << ingredient_mozzarella unless pizza_diavola.ingredients.include?(ingredient_mozzarella)
pizza_diavola.ingredients << ingredient_spicy_salami unless pizza_diavola.ingredients.include?(ingredient_spicy_salami)

pizza_bianca = Pizza.find_or_create_by!(
  name: 'Pizza Bianca',
  price: 5.00
)

pizza_bianca.ingredients << ingredient_mozzarella unless pizza_bianca.ingredients.include?(ingredient_mozzarella)
pizza_bianca.ingredients << ingredient_oregano unless pizza_bianca.ingredients.include?(ingredient_oregano)

# Seeding Orders
if Order.all.count.zero?
  10.times do
    order = Order.create!

    rand(1..5).times do
      OrderItem.create!(order: order, item: Pizza.order('RANDOM()').first, quantity: rand(1..3))
    end
    order.save!
  end
end
