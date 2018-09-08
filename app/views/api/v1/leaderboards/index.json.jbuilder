json.array! @leaderboards do |leaderboard|
  json.extract! leaderboard, :id
  json.date leaderboard.created_at.strftime("%m/%d/%y")
  json.users do
    json.array! leaderboard.users do |user|
     json.extract! user, :nickname, :avatar_url, :gender
     json.user_scores user.scores do |score|
      json.extract! score, :score
     end
  end
end
end
