class Team < ApplicationRecord
    has_many :users

    before_create :slugify
    
    def slugify
        self.slug = name.parameterize
    end
end
