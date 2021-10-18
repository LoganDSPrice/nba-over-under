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

ActiveRecord::Schema.define(version: 2021_10_15_214841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "app_settings", force: :cascade do |t|
    t.integer "locks_limit", default: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_enrollments_on_season_id"
    t.index ["user_id", "season_id"], name: "index_enrollments_on_user_id_and_season_id", unique: true
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "locks", force: :cascade do |t|
    t.bigint "pick_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pick_id"], name: "index_locks_on_pick_id"
  end

  create_table "picks", force: :cascade do |t|
    t.boolean "over"
    t.boolean "lock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "season_line_id"
    t.bigint "enrollment_id"
    t.index ["enrollment_id"], name: "index_picks_on_enrollment_id"
    t.index ["season_line_id", "enrollment_id"], name: "index_picks_on_season_line_id_and_enrollment_id", unique: true
    t.index ["season_line_id"], name: "index_picks_on_season_line_id"
  end

  create_table "season_lines", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "season_id"
    t.float "projected_wins"
    t.float "line"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_season_lines_on_season_id"
    t.index ["team_id", "season_id"], name: "index_season_lines_on_team_id_and_season_id", unique: true
    t.index ["team_id"], name: "index_season_lines_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "nba_id"
    t.string "city"
    t.string "name"
    t.string "conference"
    t.string "division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "projected_wins"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "enrollments", "seasons"
  add_foreign_key "enrollments", "users"
  add_foreign_key "locks", "picks"
  add_foreign_key "season_lines", "seasons"
  add_foreign_key "season_lines", "teams"
end
