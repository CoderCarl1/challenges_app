class Challenge < ApplicationRecord
    include ActionView::Helpers::DateHelper
    # associations
    has_and_belongs_to_many :students, :class_name => "User", counter_cache: :student_count
    has_and_belongs_to_many :teachers, :class_name => "Admin"
    has_one :leaderboard

    # before creates
    before_create :set_capitals
    before_create :slugify
    before_create :set_points
    before_create :set_time

    # validations
    validates :name, length: {within: 5..20 , message: "Name must be between 5 and 20 Characters in length"}
    validates :points, numericality: { only_integer: true, message: "Points can only be an integer" }, allow_nil: true

    # after creates
    after_create :new_leaderboard
    
    def set_capitals
        self.name = name.capitalize()
    end
    
    def slugify
        self.slug = name.parameterize
    end

    # unless specified, challenges are worth 1 point.
    def set_points
        if self.points == nil 
            self.points = 1
        end
    end

    # unless specified,challenges end day of creation at 15:30
    def set_time
        if self.time == nil
            self.time = Time.zone.today + 15.hours + 30.minutes
        end
    end

    def check_time
    # p to_time = self.time - Time.zone.now
        distance_of_time_in_words(Time.zone.now, self.time, include_seconds: true)
    end

    def new_leaderboard
        self.leaderboard = Leaderboard.create(name: self.name + " Leaderboard ")
    end

end
