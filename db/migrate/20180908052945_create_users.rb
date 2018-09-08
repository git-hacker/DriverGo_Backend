class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :open_id
      t.string :nickname
      t.integer :gender
      t.string :avatar_url
      t.references :leaderboard, foreign_key: true

      t.timestamps
    end
  end
end
