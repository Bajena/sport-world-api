class Workout < ActiveRecord::Base
  belongs_to :sport
  belongs_to :user

  scope :user, -> (user) { where user: user }
  scope :sport, -> (sport) { where sport: sport }
end