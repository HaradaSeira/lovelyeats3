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

ActiveRecord::Schema[7.0].define(version: 2023_09_12_062002) do
  create_table "event_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_items_on_event_id"
    t.index ["item_id"], name: "index_event_items_on_item_id"
  end

  create_table "events", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "opened_at"
    t.datetime "closed_at"
    t.integer "shop_id"
    t.integer "location_id"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_events_items_on_event_id"
    t.index ["item_id"], name: "index_events_items_on_item_id"
  end

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 10
    t.string "image"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "event_id"
    t.index ["event_id"], name: "index_items_on_event_id"
    t.index ["shop_id"], name: "index_items_on_shop_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "items_shops", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_items_shops_on_item_id"
    t.index ["shop_id"], name: "index_items_shops_on_shop_id"
  end

  create_table "locations", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "event_items", "events"
  add_foreign_key "event_items", "items"
  add_foreign_key "events_items", "events"
  add_foreign_key "events_items", "items"
  add_foreign_key "items", "events"
  add_foreign_key "items", "shops"
  add_foreign_key "items", "users"
  add_foreign_key "items_shops", "items"
  add_foreign_key "items_shops", "shops"
  add_foreign_key "shops", "users"
end
