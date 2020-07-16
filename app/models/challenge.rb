class Challenge < ApplicationRecord
    has_and_belongs_to_many :students, :class_name => "User"
    has_and_belongs_to_many :teachers, :class_name => "Admin"

end
