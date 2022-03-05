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

ActiveRecord::Schema.define(version: 2022_03_05_182808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoice_items", force: :cascade do |t|
    t.integer "quantity", default: 0
    t.float "subtotal"
    t.bigint "part_id", null: false
    t.bigint "invoice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
    t.index ["part_id"], name: "index_invoice_items_on_part_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "status", default: 0
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_parts_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoice_items", "parts"
  add_foreign_key "invoices", "users"
end
