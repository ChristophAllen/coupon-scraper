# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20190207220705) do

  create_table "albertsons", force: :cascade do |t|
    t.string   "title"
    t.string   "string"
    t.string   "value"
    t.string   "repeaters"
    t.string   "array"
    t.string   "total"
    t.string   "store"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checkout51__forces", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checkout51s", force: :cascade do |t|
    t.string   "title"
    t.string   "value"
    t.string   "store"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "total"
  end

  create_table "checkout51savingstars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title1"
    t.string   "title2"
    t.string   "value1"
    t.string   "value2"
    t.string   "link1"
    t.string   "link2"
    t.string   "store1"
    t.string   "store2"
    t.string   "repeaters"
    t.integer  "copies"
  end

  create_table "checkout51targetcoupons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title1"
    t.string   "title2"
    t.string   "store1"
    t.string   "store2"
    t.string   "link1"
    t.string   "link2"
    t.string   "value1"
    t.string   "value22"
    t.string   "repeaters"
    t.string   "value2"
    t.integer  "copies"
  end

  create_table "doublesavers", force: :cascade do |t|
    t.string   "title1"
    t.string   "title2"
    t.string   "value1"
    t.string   "value2"
    t.string   "link1"
    t.string   "link2"
    t.string   "repeaters"
    t.string   "store1"
    t.string   "store2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "copies"
    t.string   "title3"
    t.string   "value3"
    t.string   "link3"
    t.string   "store3"
    t.boolean  "triplesave"
  end

# Could not dump table "hebs" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "hyvees", force: :cascade do |t|
    t.string   "title"
    t.string   "string"
    t.string   "value"
    t.string   "link"
    t.string   "repeaters"
    t.string   "array"
    t.string   "store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "total"
  end

  create_table "ibotta", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "value"
    t.string   "store"
    t.string   "link"
    t.string   "string"
    t.string   "total"
    t.string   "values"
  end

  create_table "ibottacheckout51s", force: :cascade do |t|
    t.string   "title1"
    t.string   "title2"
    t.string   "value1"
    t.string   "value2"
    t.string   "link1"
    t.string   "link2"
    t.string   "store1"
    t.string   "store2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "repeaters"
    t.integer  "copies"
  end

# Could not dump table "ibottasavingstars" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "kroger_tables", force: :cascade do |t|
    t.integer "value", null: false
    t.string  "store", null: false
    t.string  "title", null: false
    t.string  "link",  null: false
  end

  create_table "krogercheckout51s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title1"
    t.string   "title2"
    t.string   "value1"
    t.string   "value2"
    t.string   "store1"
    t.string   "store2"
    t.string   "link1"
    t.string   "link2"
    t.string   "repeaters"
    t.integer  "copies"
  end

# Could not dump table "krogeribotta" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "krogers" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "krogersavingstars" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "krogertargetcoupons" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "meijers", force: :cascade do |t|
    t.string   "title"
    t.string   "string"
    t.string   "value"
    t.string   "link"
    t.string   "repeaters"
    t.string   "array"
    t.string   "store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "total"
  end

  create_table "newcheckout51s", force: :cascade do |t|
    t.string   "title"
    t.string   "value"
    t.string   "store"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "publixes" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "savingstar", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "savingstars" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "smith2s", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "total"
    t.string   "title"
    t.string   "value"
    t.string   "link"
    t.string   "store"
  end

  create_table "smiths", force: :cascade do |t|
    t.string   "title"
    t.string   "price"
    t.string   "store"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "table_krogertargetcoupons" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "targetcoupons", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "value"
    t.string   "link"
    t.string   "string"
    t.string   "store"
    t.string   "total"
  end

# Could not dump table "targetcouponsavingstars" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "targetibotta" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "targetibottasavingstars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title1"
    t.string   "title2"
    t.string   "title3"
    t.string   "value1"
    t.string   "value2"
    t.string   "value3"
    t.string   "link1"
    t.string   "link2"
    t.string   "link3"
  end

  create_table "targetibottum", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "triplesaves", force: :cascade do |t|
    t.string   "title1"
    t.string   "title2"
    t.string   "title3"
    t.string   "value1"
    t.string   "value2"
    t.string   "value3"
    t.string   "link1"
    t.string   "link2"
    t.string   "link3"
    t.string   "store1"
    t.string   "store2"
    t.string   "store3"
    t.string   "repeaters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
