module CookbookHelper

  FOODS = ['Asparagus', 'Cucumbers', 'Onions', 'Garlic', 'Lettuce',
           'Broccoli', 'Spinach', 'Tomatoes', 'Potatoes', 'Eggplants',
           'Zucchini', 'Sweet Potatoes', 'Beef', 'Pork', 'Chicken', 'Turkey',
           'Ribs', 'Ham', 'Steak', 'Bacon', 'Lamb', 'Tofu', 'Pasta', 'Rice',
           'Artichoke', 'Curry', 'Cauliflower', 'Bell Peppers', 'Peppercorns']

  def random_keywords
    adjectives = ['Bold', 'Buttery', 'Cheesy', 'Chewy', 'Creamy', 'Crispy',
                  'Delightful', 'Intense', 'Juicy', 'Messy', 'Rich', 'Savory',
                  'Sharp', 'Sweet', 'Tangy', 'Thick', 'Zesty']
    methods = ['Baked', 'Barbequed', 'Battered', 'Burnt', 'Curried', 'Fried',
               'Glazed', 'Grilled', 'Sauteed', 'Smoked', 'Steamed', 'Stuffed']
    [adjectives.sample, methods.sample, FOODS.sample, 'with', FOODS.sample]

  end

  def random_category
    types = ['Appetizer', 'Entree', 'Side', 'Dessert']
    types.sample
  end

  def random_ingredients
    seasoning = ['Salt', 'Pepper', 'Cumin', 'Paprika', 'Garlic Powder', 'Nutmeg',
                 'Tumeric', 'Chili Powder', 'Soy Sauce', 'Fish Sauce',
                 'Curry Paste', 'Hot Sauce', 'Sriracha', 'Barbeque Sauce',
                 'Heavy Cream', 'Milk', 'Vinegar', 'Chicken Stock', 'Red Wine']
    other = ['Olive Oil', 'Vegetable Oil', 'Water', 'Flour', 'Corn Starch',
             'Sugar', 'Butter']
    FOODS.sample(rand(1..5)) + seasoning.sample(rand(1..3)) +
      other.sample(rand(1..2))
  end
end
