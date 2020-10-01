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

ActiveRecord::Schema.define(version: 2020_09_30_105007) do

  create_table "ms_books", force: :cascade do |t|
    t.string "name", limit: 250
    t.integer "ms_publisher_id"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ms_members", force: :cascade do |t|
    t.string "name", limit: 100
    t.integer "age"
    t.text "address"
    t.string "phone", limit: 13
    t.string "email", limit: 50
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ms_publishers", force: :cascade do |t|
    t.string "name", limit: 100
    t.string "phone", limit: 13
    t.text "address"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tr_loans", force: :cascade do |t|
    t.string "member_name", limit: 100
    t.string "member_phone", limit: 13
    t.string "member_email", limit: 50
    t.integer "ms_book_id"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
