class Pizza < Item
  has_many :pizza_ingredients, foreign_key: 'item_id'
  has_many :ingredients, through: :pizza_ingredients

  def as_json(options = {})
    super(options).merge(
      ingredients: self.ingredients.map(&:name)
    )
  end
end
