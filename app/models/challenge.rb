class Challenge < ApplicationRecord
    has_and_belongs_to_many :students, :class_name => "User", counter_cache: :student_count
    has_and_belongs_to_many :teachers, :class_name => "Admin"
    has_one :leaderboard
    
    before_create :set_capitals
    before_create :slugify
    before_create :check_points

    # before_create :no_swears

    validates :name, length: {within: 5..20 , message: "Name must be between 5 and 20 Characters in length"}
    validates :points, numericality: { only_integer: true, message: "Points can only be an integer" }, allow_nil: true

    # validates_presence_of :name
    # validates_length_of :name, :minimum
    # validates_numericality_of :points, :greater_than, :message => ""
    # validates_exclusion_of :name, in: :list of swears ,:message => "cannot be in the name"
    
    
    # :on => :save

    after_create :new_leaderboard
    

    def set_capitals
        self.name = name.capitalize()
    end
    
    def slugify
        self.slug = name.parameterize
    end

    def check_points
        if self.points == nil 
            self.points = 1
        end
        
    end

    def new_leaderboard
        self.leaderboard = Leaderboard.create(name: self.name + " Leaderboard ")
    end

end
