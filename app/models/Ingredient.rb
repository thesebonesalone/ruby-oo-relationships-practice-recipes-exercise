class Ingredient
    @@all = []
    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def allergen?
        Allergy.all.any? {|v| v.ingredient == self}
    end
    def most_common_allergen
        

    end
    def allergic_users
        Allergy.all.select {|v| v.ingredient == self}.map{|u| u.user}
    end
    def self.most_common_allergen
        self.all.sort_by {|v| v.allergic_users.length}[-1]
    end


end
