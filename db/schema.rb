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

ActiveRecord::Schema[7.0].define(version: 2022_12_05_012454) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinema_places", force: :cascade do |t|
    t.bigint "cinema_id", null: false
    t.string "cinema_place_type"
    t.string "price"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["cinema_id"], name: "index_cinema_places_on_cinema_id"
  end

  create_table "cinemas", force: :cascade do |t|
    t.string "name"
    t.integer "multiplex_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "movie_id"
  end

  create_table "clients", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "mutiplex_id"
    t.string "position"
    t.string "rol"
    t.date "start_date"
    t.string "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "multiplexes", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "cinemas_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "points", force: :cascade do |t|
    t.bigint "product_order_id", null: false
    t.bigint "client_id", null: false
    t.integer "count"
    t.string "state"
    t.string "point_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_points_on_client_id"
    t.index ["product_order_id"], name: "index_points_on_product_order_id"
  end

  create_table "product_items", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_order_id"
    t.index ["product_id"], name: "index_product_items_on_product_id"
  end

  create_table "product_orders", force: :cascade do |t|
    t.bigint "multiplex_id", null: false
    t.bigint "client_id", null: false
    t.string "detail"
    t.date "date"
    t.string "type"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.index ["client_id"], name: "index_product_orders_on_client_id"
    t.index ["multiplex_id"], name: "index_product_orders_on_multiplex_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "product_type"
    t.string "detail"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "state"
    t.integer "product_order_id"
    t.integer "cinema_place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "telephone"
    t.string "address"
    t.string "id_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cinema_places", "cinemas"
  add_foreign_key "clients", "users"
  add_foreign_key "employees", "users"
  add_foreign_key "points", "clients"
  add_foreign_key "points", "product_orders"
  add_foreign_key "product_items", "products"
  add_foreign_key "product_orders", "clients"
  add_foreign_key "product_orders", "multiplexes"
end
