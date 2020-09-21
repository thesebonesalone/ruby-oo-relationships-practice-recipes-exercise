class Recipe
    @@all = []
    def initialize
        @@all << self
    end
    def self.all
        @@all
    end
    def self.most_popular
        self.all.sort_by {|v| v.users.length}
    end
    def users
        RecipeCard.all.select {|v| v.recipe == self}.map {|u| u.user}
    end 
    def ingredients
        RecipeIngredient.all.select {|v| v.recipe == self}
    end
    def allergens
        self.ingredients.select {|v| v.ingredient.allergen? }.map {|u| u.ingredient}
    end
    def allergens_as_allergies
        self.ingredients.select {|v| v.ingredient.allergen? }.map {|u| u.ingredient}
    end
    
    def add_ingredients(array)
        array.each {|v| RecipeIngredient.new(self, v)}
    end




end