User.create!(name: "Example User",
             email: "example@cookbook.com",
             password: "longpassword",
             password_confirmation: "longpassword")

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
  User.find_by(id: (n % 20) + 2).recipes.create(title: title, content: content, created_at: created_at)
end
