class RecipeCard
    @@all = []
    attr_accessor :user, :recipe, :rating
    def initialize(user,recipe,rating = 5)
        @user = user
        @recipe = recipe
        @rating = rating
        @@all << self
    end
    def self.all
        @@all
    end

end