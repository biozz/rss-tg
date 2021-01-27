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

ActiveRecord::Schema.define(version: 2021_01_24_213436) do

  create_table "bots", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["name"], name: "index_bots_on_name", unique: true
    t.index ["token"], name: "index_bots_on_token", unique: true
    t.index ["user_id"], name: "index_bots_on_user_id"
  end

  create_table "briefings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "bot_id", null: false
    t.index ["bot_id"], name: "index_briefings_on_bot_id"
    t.index ["name"], name: "index_briefings_on_name", unique: true
    t.index ["user_id"], name: "index_briefings_on_user_id"
  end

  create_table "briefings_feeds", id: false, force: :cascade do |t|
    t.integer "briefing_id", null: false
    t.integer "feed_id", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string "title"
    t.datetime "published_at"
    t.text "content"
    t.text "url"
    t.string "author"
    t.integer "feed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feed_id"], name: "index_entries_on_feed_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.text "url"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_feeds_on_name", unique: true
    t.index ["url"], name: "index_feeds_on_url", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "bots", "users"
  add_foreign_key "briefings", "bots"
  add_foreign_key "briefings", "users"
  add_foreign_key "entries", "feeds"
end
