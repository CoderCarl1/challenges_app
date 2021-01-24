class ChallengeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :slug, :language, :description, :time

  has_many :students
  has_many :teachers
  has_one :leaderboard
end
