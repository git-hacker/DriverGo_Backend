class AddLocationDataToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_stored_locatin, :st_point, geographic: true
    add_column :users, :total_distance, :decimal
  end
end
