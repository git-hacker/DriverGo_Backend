json.array! @scores do |score|
  json.extract! score, :id, :score, :created_at
  json.user do
    json.extract! score.user, :nickname, :avatar_url
  end

end
