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

ActiveRecord::Schema[7.1].define(version: 2024_06_28_044119) do
  create_table "addresses", force: :cascade do |t|
    t.string "street_name"
    t.string "neighbourhood"
    t.string "full_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street_number"
    t.string "street_type"
    t.string "ward"
    t.string "school_division"
    t.string "school_division_ward"
    t.string "latitude"
    t.string "longitude"
    t.string "street_address"
  end

  create_table "parks", force: :cascade do |t|
    t.string "park_name"
    t.string "address"
    t.string "location_description"
    t.string "neighbourhood"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "school"
    t.string "street_name"
    t.string "language"
    t.integer "year_installed"
    t.string "legislation_link"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
