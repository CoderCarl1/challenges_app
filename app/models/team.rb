class Team < ApplicationRecord
    has_many :users

    validates :name, length: {within: 3..10 , message: "Name must be between 3 and 10 Characters in length"}, uniqueness: {case_sensitive: true}

    before_create :set_capitals
    before_create :slugify
    
    def set_capitals
        self.name = name.capitalize()
    end

    def slugify
        self.slug = name.parameterize
    end
end
