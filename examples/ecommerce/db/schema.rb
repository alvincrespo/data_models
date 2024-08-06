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

ActiveRecord::Schema[7.1].define(version: 2024_08_08_005508) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_memberships", id: false, force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "user_id"], name: "index_account_memberships_on_account_id_and_user_id"
    t.index ["role_id"], name: "index_account_memberships_on_role_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "availabilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id", "product_id"], name: "index_order_items_on_order_id_and_product_id"
  end

  create_table "order_status_histories", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "order_status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id", "order_status_id"], name: "index_order_status_histories_on_order_id_and_order_status_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "placed_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_price_histories", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.decimal "price"
    t.boolean "active", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "active"], name: "index_product_price_histories_on_product_id_and_active"
    t.index ["product_id"], name: "index_product_price_histories_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "availability_id", null: false
    t.bigint "supplier_id", null: false
    t.integer "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["availability_id"], name: "index_products_on_availability_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplier_memberships", id: false, force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "supplier_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "supplier_id"], name: "index_supplier_memberships_on_account_id_and_supplier_id"
    t.index ["role_id"], name: "index_supplier_memberships_on_role_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "account_memberships", "accounts"
  add_foreign_key "account_memberships", "roles"
  add_foreign_key "account_memberships", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_status_histories", "order_statuses"
  add_foreign_key "order_status_histories", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "product_price_histories", "products"
  add_foreign_key "products", "availabilities"
  add_foreign_key "products", "suppliers"
  add_foreign_key "supplier_memberships", "accounts"
  add_foreign_key "supplier_memberships", "roles"
  add_foreign_key "supplier_memberships", "suppliers"
end
