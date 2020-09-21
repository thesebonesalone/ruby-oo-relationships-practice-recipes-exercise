class User
    @@all = []
    attr_accessor :allergies
    attr_reader :name
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def declare_allergy(ingredient)
        Allergy.new(self,ingredient)
    end
    def allergens
        Allergy.all.select {|v| v.user == self}
    end
    def add_recipe_card(recipe, rating = 5)
        RecipeCard.new(self, recipe, rating)
    end
    def recipe_cards
        RecipeCard.all.select {|v| v.user == self}
    end

    def top_three_recipes
        ratings_array = self.recipe_cards.sort_by {|v| v.rating}
        count = 0
        final_array = []
        ratings_array.each do |v|
            final_array.unshift(v)
            count += 1
            break if count == 3
        end
        final_array
    end
    def most_recent_recipe
        self.recipe_cards[-1]
    end
    def is_recipe_unsafe?(recipe)
        allergen = false
        recipe.ingredients.each do |value|
            if self.allergens.map{|v| v.ingredient}.include?(value.ingredient) == true
            allergen = true
            end
        end
        allergen
    end
    def safe_recipes
        Recipe.all.reject {|v| self.is_recipe_unsafe?(v) != false}
    end
end