require 'json'
require 'open-uri'


# This file should contain all the record creation needed to seed the database with its default 
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# cocktails = ["Mojito",
# "Long Island Iced Tea",
# "Manhattan",
# "Daiquiri",
# "Margarita",
# "Bloody Mary",
# "Cosmopolitan",
# "Tom Collins"]

# cocktails.each{|cocktail| 

# new_cocktail = Cocktail.create(name: cocktail)

# url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail.name.gsub(" ", "%20")}"
# cocktails = JSON.parse(open(url).read)

# ingredients_measures = cocktails["drinks"][0].select{|k,v| k.match?(/^str[a-zA-Z]*[1-9]$/)}
# ingredients = ingredients_measures.select{|k,v| k.match?(/^strIngredient/)}
# hash = ingredients.map{|el| {el[1] => ingredients_measures["strMeasure#{el[0][/[1-9]*[1-9]$/]}"]} }
# doses = hash.select{|k,v| v }

# # [/[1-9]*[1-9]$/] to select only the number of measures
# # ingredients.map{|el| {el[1] => ingredients_measures["strMeasure#{el[0][/[1-9]*[1-9]$/]}"]} }
# # ingredients.map{|el| {el[1] => ingredients_measures["strMeasure#{el[0][/[1-9]*[1-9]$/]}"]} }.reduce Hash.new, :merge
# # hash_ingredient.select{|k,v| v }
# doses.each do |dose|
  
#   ing = Ingredient.where("name = #{dose[0]}")[0]
#   new_dose = Dose.create(
#     ingredient: ing, description: dose[1], cocktail: new_cocktail
#   )
#   puts new_dose 
# end

# }


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktails_serialized = open(url).read
cocktails = JSON.parse(cocktails_serialized)

cocktails["drinks"].each{|drink| Ingredient.create(name: drink["strIngredient1"])}