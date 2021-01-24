class LeaderboardSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :slug

  belongs_to :challenge
  has_many :students
end
