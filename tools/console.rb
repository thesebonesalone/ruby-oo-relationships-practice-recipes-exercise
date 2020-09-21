require_relative '../config/environment.rb'
require_relative '../app/models/Allergy.rb'
require_relative '../app/models/Ingredient.rb'
require_relative '../app/models/Recipe.rb'
require_relative '../app/models/RecipeCard.rb'
require_relative '../app/models/RecipeIngredient.rb'
require_relative '../app/models/User.rb'

soup = Recipe.new
cake = Recipe.new
burgers = Recipe.new
bob = User.new("bob")
bread = Ingredient.new("bread")
frosting = Ingredient.new("frosting")
sugar = Ingredient.new("sugar")
carrot = Ingredient.new("carrot")
beef = Ingredient.new("beef")
Allergy.new(bob,carrot)
soup.add_ingredients([carrot,beef])
cake.add_ingredients([bread,frosting,sugar])
burgers.add_ingredients([beef,bread])
bob.add_recipe_card(soup)
bob.add_recipe_card(burgers, 6)
bob.add_recipe_card(cake, 7)
tom = User.new("tom")
jane = User.new("Jane")
frank = User.new("frank")
dennis = User.new("Dennis")
charlie = User.new("Charlie")
dee = User.new("Dee")
mac = User.new("Mac")
mac.declare_allergy(bread)
dee.declare_allergy(carrot)
charlie.declare_allergy(carrot)


binding.pry
