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

ActiveRecord::Schema.define(version: 20170720184933) do

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "goal"
    t.text "rules"
    t.integer "time"
    t.integer "category_id"
    t.integer "user_id"
  end

  create_table "activities_topics", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "topic_id"
    t.index ["activity_id"], name: "index_activities_topics_on_activity_id"
    t.index ["topic_id"], name: "index_activities_topics_on_topic_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
