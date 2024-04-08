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

ActiveRecord::Schema[7.0].define(version: 2024_04_07_142351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "driver_report_services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "driver_name"
    t.string "email"
    t.string "mobile"
    t.integer "national_id"
    t.string "license_no"
    t.string "license_type"
    t.date "license_issue_date"
    t.date "date_of_birth"
    t.text "address"
    t.date "joining_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "fuel_stations", force: :cascade do |t|
    t.string "station_name"
    t.string "station_code"
    t.string "contact_name"
    t.string "contact_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_fuel_stations_on_user_id"
  end

  create_table "fuel_types", force: :cascade do |t|
    t.string "fuel_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refuel_entries", force: :cascade do |t|
    t.string "fuel_amount"
    t.integer "odometer_reading_at_refuelling"
    t.date "fuel_entry_date"
    t.integer "units_taken"
    t.string "refuel_place"
    t.bigint "vehicle_id", null: false
    t.bigint "fuel_type_id", null: false
    t.bigint "fuel_station_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fuel_station_id"], name: "index_refuel_entries_on_fuel_station_id"
    t.index ["fuel_type_id"], name: "index_refuel_entries_on_fuel_type_id"
    t.index ["vehicle_id"], name: "index_refuel_entries_on_vehicle_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "to"
    t.string "from"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "token_blacklists", force: :cascade do |t|
    t.string "token"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "company_name"
    t.string "username"
  end

  create_table "vehicle_assignments", force: :cascade do |t|
    t.date "start_date"
    t.bigint "vehicle_id", null: false
    t.bigint "driver_id", null: false
    t.bigint "route_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_vehicle_assignments_on_driver_id"
    t.index ["route_id"], name: "index_vehicle_assignments_on_route_id"
    t.index ["vehicle_id"], name: "index_vehicle_assignments_on_vehicle_id"
  end

  create_table "vehicle_report_services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_trip_report_services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_trips", force: :cascade do |t|
    t.integer "no_of_trips"
    t.time "start_Time"
    t.time "end_time"
    t.date "trip_date"
    t.string "amount_earned"
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_vehicle_trips_on_vehicle_id"
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string "vehicle_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vehicle_name"
    t.string "license_plate"
    t.string "ownership"
    t.string "alert_cell"
    t.string "alert_email"
    t.date "registration_date"
    t.integer "seat_capacity"
    t.bigint "vehicle_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
    t.index ["vehicle_type_id"], name: "index_vehicles_on_vehicle_type_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "drivers", "users"
  add_foreign_key "fuel_stations", "users"
  add_foreign_key "refuel_entries", "fuel_stations"
  add_foreign_key "refuel_entries", "fuel_types"
  add_foreign_key "refuel_entries", "vehicles"
  add_foreign_key "vehicle_assignments", "drivers"
  add_foreign_key "vehicle_assignments", "routes"
  add_foreign_key "vehicle_assignments", "vehicles"
  add_foreign_key "vehicle_trips", "vehicles"
  add_foreign_key "vehicles", "users"
  add_foreign_key "vehicles", "vehicle_types"
end
