json.array! @users do |user|
  json.extract! user, :id, :nickname, :gender, :avatar_url,:total_distance,:level,:points
  json.date user.created_at.strftime("%m/%d/%y")
  json.user do
    json.scores user.scores do |score|
    json.extract! score, :score
  end
  end
end
