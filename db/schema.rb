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

ActiveRecord::Schema.define(version: 20171105153956) do

  create_table "listings", force: :cascade do |t|
    t.string   "plan_title"
    t.text     "plan_detail"
    t.string   "shop_info"
    t.integer  "acceptable"
    t.integer  "plan_time"
    t.text     "guide_detail"
    t.text     "cancel_policy"
    t.text     "capacity"
    t.string   "nationality"
    t.string   "language"
    t.string   "language_level"
    t.integer  "age"
    t.string   "sex"
    t.integer  "price_setting"
    t.text     "favorite_topic"
    t.string   "residentcountry"
    t.string   "residentcity"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "my_goal"
    t.string   "address"
    t.text     "myprofile"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "active"
    t.integer  "user_id"
    t.string   "service_type"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "listing_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["listing_id"], name: "index_photos_on_listing_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "start_date"
    t.integer  "price_setting"
    t.integer  "total_price"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.time     "reservation_time"
    t.text     "reservation_message"
    t.index ["listing_id"], name: "index_reservations_on_listing_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "name"
    t.string   "phone_number"
    t.string   "description"
    t.string   "publishable_key"
    t.string   "secret_key"
    t.string   "stripe_user_id"
    t.string   "currency"
    t.string   "stripe_account_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
