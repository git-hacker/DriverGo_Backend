class User < ApplicationRecord
  has_many :scores
  belongs_to :leaderboard

end
