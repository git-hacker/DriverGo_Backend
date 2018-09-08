class ChangeDefaultTotalDistanceValue < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :total_distance, :decimal,  default: 0.0
  end
end
