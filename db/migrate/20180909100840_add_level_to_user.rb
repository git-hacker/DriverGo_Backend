class AddLevelToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :level, :integer, default: 1
  end
end
