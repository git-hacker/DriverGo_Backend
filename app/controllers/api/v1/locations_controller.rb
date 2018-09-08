class Api::V1::LocationsController < Api::V1::BaseController



 def create
   latitude = params[:latitude]
   longitude = params[:longitude]

   point = "POINT(#{longitude} #{latitude})"
   user = User.find(params[:user_id])

   if user.last_stored_locatin.nil?
    user.last_stored_locatin = point
    user.save!

    puts "WHY NO SHIT"
  else
    puts "oh shit"
    last_visited = user.last_stored_locatin
    last_visited_as_point = "POINT(#{last_visited.longitude} #{last_visited.latitude})"
    sql = %(
      SELECT ST_Distance(
          ST_GeomFromText('#{last_visited_as_point}', 4326),
          ST_GeomFromText('#{point}', 4326)
        )
      AS distance)
    records_array = ActiveRecord::Base.connection.execute(sql)
    puts "SHIIIT"
    puts records_array.first

    distance = records_array[0]["distance"]
    distance *= 100.0

    user.last_stored_locatin = point
    user.total_distance += distance
    user.save!
  end

  render json: {
    last_stored_location: point,
    total_distance: user.total_distance
  }
 end


end
