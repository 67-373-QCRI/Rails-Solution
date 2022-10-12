# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_10_222614) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "team_leader_id", null: false
    t.string "name"
    t.text "members", default: [], array: true
    t.text "description"
    t.date "start_date", default: "2022-10-11"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_leader_id"], name: "index_projects_on_team_leader_id"
  end

  create_table "publications", force: :cascade do |t|
    t.bigint "project_id"
    t.string "title", null: false
    t.text "authors", default: [], array: true
    t.date "published_on"
    t.boolean "published", null: false
    t.string "doi", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.index ["project_id"], name: "index_publications_on_project_id"
  end

  create_table "researchers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "group"
    t.string "job_title"
    t.text "bio"
    t.boolean "is_leader", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_researchers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "projects", "researchers", column: "team_leader_id"
  add_foreign_key "publications", "projects"
  add_foreign_key "researchers", "users"
end
