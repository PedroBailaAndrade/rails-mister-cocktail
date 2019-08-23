# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Ingredient.destroy_all
Dose.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
ingredients = JSON.parse(user_serialized)
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

dose45 = Dose.new(description: '10ml')
ingredient1 = Ingredient.first
cocktail1 = Cocktail.last
dose45.ingredient_id = ingredient1.id
dose45.cocktail_id = cocktail1.id
dose45.save

# puts ingredient = JSON.parse(user_serialized["drinks"]["strIngredient1"])
