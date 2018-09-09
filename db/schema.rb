# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_09_100840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "leaderboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "score"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "open_id"
    t.string "nickname"
    t.integer "gender"
    t.string "avatar_url"
    t.bigint "leaderboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.geography "last_stored_locatin", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.decimal "total_distance", default: "0.0"
    t.integer "points", default: 0
    t.integer "level", default: 1
    t.index ["leaderboard_id"], name: "index_users_on_leaderboard_id"
  end

  add_foreign_key "scores", "users"
  add_foreign_key "users", "leaderboards"
end
