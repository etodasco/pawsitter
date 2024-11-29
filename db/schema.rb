ActiveRecord::Schema[7.2].define(version: 2024_11_27_010057) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.bigint "reservation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_messages_on_reservation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pet_reservations", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_pet_reservations_on_pet_id"
    t.index ["reservation_id"], name: "index_pet_reservations_on_reservation_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "species"
    t.text "description"
    t.string "checklist"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.bigint "pet_owner_id", null: false
    t.bigint "pet_sitter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pet_id"
    t.index ["pet_owner_id"], name: "index_reservations_on_pet_owner_id"
    t.index ["pet_sitter_id"], name: "index_reservations_on_pet_sitter_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "reservation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
  end

  create_table "solid_cable_messages", force: :cascade do |t|
    t.binary "channel", null: false
    t.binary "payload", null: false
    t.datetime "created_at", null: false
    t.bigint "channel_hash", null: false
    t.index ["channel"], name: "index_solid_cable_messages_on_channel"
    t.index ["channel_hash"], name: "index_solid_cable_messages_on_channel_hash"
    t.index ["created_at"], name: "index_solid_cable_messages_on_created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.integer "average_rating", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.boolean "pet_sitter", default: false
    t.text "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "messages", "reservations"
  add_foreign_key "messages", "users"
  add_foreign_key "pet_reservations", "pets"
  add_foreign_key "pet_reservations", "reservations"
  add_foreign_key "pets", "users"
  add_foreign_key "reservations", "users", column: "pet_owner_id"
  add_foreign_key "reservations", "users", column: "pet_sitter_id"
  add_foreign_key "reviews", "reservations"
end
