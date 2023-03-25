# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
names = [
  "Ethnic",
  "Fast food",
  "Fast casual",
  "Casual dining",
  "Premium casual",
  "Family style",
  "Fine dining",
]

5.times do
  category = Category.create(name: names.sample)
end

10.times do
  recipe = Recipe.create(
    chef: Faker::Name.name,
    difficulty: Faker::Number.within(range: 1..10),
    name: Faker::Food.dish,
    description: Faker::Food.description,
    prep_time: rand(1..100),
    time_to_cook: rand(1..100),
    ingredients: Faker::Food.ingredient,
    yeild: Faker::Number.within(range: 1..10),
    total_time: rand(1..100),
    category_id: Category.pluck(:id).sample,
  )
end
