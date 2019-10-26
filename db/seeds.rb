User.create!(name: "Example User",
             email: "example@cookbook.com",
             password: "longpassword",
             password_confirmation: "longpassword")

DishType.create!(name: "appetizer")
DishType.create!(name: "entree")
DishType.create!(name: "side")
DishType.create!(name: "dessert")

@volume = Variety.create!(name: "volume")
@weight = Variety.create!(name: "weight")
@mass = Variety.create!(name: "mass")
@unit = Variety.create!(name: "unit")

@volume.measurements.create!(name: "cup")
@volume.measurements.create!(name: "tablespoon")
@volume.measurements.create!(name: "teaspoon")
@weight.measurements.create!(name: "pound")
@mass.measurements.create!(name: "gram")
@unit.measurements.create!(name: "unit")

20.times do
  name = Faker::Food.unique.ingredient
  food = Food.new(name: name)
  food.varieties << (Variety.find(rand(4) + 1))
  food.save
end

20.times do |n|
  name = Faker::Name.name
  email = "example#{n+1}@cookbook.com"
  password = "longerpassword"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

50.times do |n|
  title = Faker::Food.dish
  content = Faker::Food.description
  created_at = Faker::Time.between(20.days.ago, 5.minutes.ago)
  @recipe = User.find((n % 20) + 2).recipes.create!(title: title, content: content,
                                                    dish_type: DishType.find((n % 4) + 1),
                                                    created_at: created_at)
  (rand(5) + 1).times do |n|
    food = Food.find(rand(20) + 1)
    variety = food.varieties.first
    measurement = variety.measurements.first
    @recipe.ingredients.create!(food: food,
                                amount: rand(6) + rand(),
                                measurement: measurement)
  end
end

