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

ActiveRecord::Schema[8.0].define(version: 2025_09_15_202434) do
  create_table "deliveries", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.string "status"
    t.datetime "scheduled_at"
    t.datetime "completed_at"
    t.string "recipient_name"
    t.string "recipient_document"
    t.string "photo_url"
    t.float "latitude"
    t.float "longitude"
    t.text "notes"
    t.integer "attempts_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_deliveries_on_trip_id"
  end

  create_table "pickups", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.string "status"
    t.datetime "scheduled_at"
    t.datetime "completed_at"
    t.string "recipient_name"
    t.string "recipient_document"
    t.string "photo_url"
    t.float "latitude"
    t.float "longitude"
    t.text "notes"
    t.integer "attempts_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_pickups_on_trip_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer "route_id", null: false
    t.string "driver_name"
    t.string "vehicle_plate"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_trips_on_route_id"
  end

  add_foreign_key "deliveries", "trips"
  add_foreign_key "pickups", "trips"
  add_foreign_key "trips", "routes"
end
