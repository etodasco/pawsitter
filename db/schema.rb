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

ActiveRecord::Schema[7.2].define(version: 2024_11_16_161646) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "reservations_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservations_id"], name: "index_messages_on_reservations_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pet_reservations", force: :cascade do |t|
    t.bigint "reservations_id", null: false
    t.bigint "pets_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pets_id"], name: "index_pet_reservations_on_pets_id"
    t.index ["reservations_id"], name: "index_pet_reservations_on_reservations_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.string "description"
    t.string "checklist"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_pets_on_users_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.integer "pet_owner_id"
    t.integer "pet_sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.bigint "reservations_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservations_id"], name: "index_reviews_on_reservations_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "reservations", column: "reservations_id"
  add_foreign_key "messages", "users"
  add_foreign_key "pet_reservations", "pets", column: "pets_id"
  add_foreign_key "pet_reservations", "reservations", column: "reservations_id"
  add_foreign_key "pets", "users", column: "users_id"
  add_foreign_key "reviews", "reservations", column: "reservations_id"
end
