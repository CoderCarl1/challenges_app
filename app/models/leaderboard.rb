class Leaderboard < ApplicationRecord
  belongs_to :challenge
  has_many :students, :class_name => "User", through: :challenge
  # has_many :teams, through: :challenge

  before_create :slugify

  def slugify
    self.slug = name.parameterize
  end

end
