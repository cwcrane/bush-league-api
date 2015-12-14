# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151213230458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.date     "date"
    t.time     "time"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "user_id"
    t.integer  "location_id"
    t.date     "date_created"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "leagues", ["location_id"], name: "index_leagues_on_location_id", using: :btree
  add_index "leagues", ["user_id"], name: "index_leagues_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_stats", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "season_id"
    t.integer  "goals"
    t.integer  "assists"
    t.decimal  "penalty_mins"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "player_stats", ["game_id"], name: "index_player_stats_on_game_id", using: :btree
  add_index "player_stats", ["season_id"], name: "index_player_stats_on_season_id", using: :btree
  add_index "player_stats", ["team_id"], name: "index_player_stats_on_team_id", using: :btree
  add_index "player_stats", ["user_id"], name: "index_player_stats_on_user_id", using: :btree

  create_table "rosters", force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  add_index "rosters", ["team_id"], name: "index_rosters_on_team_id", using: :btree
  add_index "rosters", ["user_id"], name: "index_rosters_on_user_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "league_id"
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "seasons", ["league_id"], name: "index_seasons_on_league_id", using: :btree
  add_index "seasons", ["team_id"], name: "index_seasons_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "user_id"
    t.date     "date_created"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  add_foreign_key "leagues", "locations"
  add_foreign_key "leagues", "users"
  add_foreign_key "player_stats", "games"
  add_foreign_key "player_stats", "seasons"
  add_foreign_key "player_stats", "teams"
  add_foreign_key "player_stats", "users"
  add_foreign_key "rosters", "teams"
  add_foreign_key "rosters", "users"
  add_foreign_key "seasons", "leagues"
  add_foreign_key "seasons", "teams"
  add_foreign_key "teams", "users"
end
