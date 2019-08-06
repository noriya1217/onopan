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

ActiveRecord::Schema.define(version: 2019_08_06_064425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_allergies_on_ingredient_id"
    t.index ["user_id"], name: "index_allergies_on_user_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "score", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_evaluations_on_store_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "number_purchases", force: :cascade do |t|
    t.integer "number", null: false
    t.boolean "permission", null: false
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_number_purchases_on_product_id"
    t.index ["user_id"], name: "index_number_purchases_on_user_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", null: false
    t.integer "price", null: false
    t.text "content", null: false
    t.text "preservation", null: false
    t.text "how_to_eat", null: false
    t.text "expiration", null: false
    t.text "shipping", null: false
    t.text "remarks"
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_relationships_on_store_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "address", null: false
    t.string "telephone", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.string "access", null: false
    t.string "image", null: false
    t.index ["email"], name: "index_stores_on_email", unique: true
    t.index ["reset_password_token"], name: "index_stores_on_reset_password_token", unique: true
  end

  create_table "used_ingredients", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_used_ingredients_on_ingredient_id"
    t.index ["product_id"], name: "index_used_ingredients_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age"
    t.string "sex"
    t.string "profession"
    t.string "email", null: false
    t.string "address", null: false
    t.integer "line_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "allergies", "ingredients"
  add_foreign_key "allergies", "users"
  add_foreign_key "evaluations", "stores"
  add_foreign_key "number_purchases", "products"
  add_foreign_key "number_purchases", "users"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "stores"
  add_foreign_key "relationships", "stores"
  add_foreign_key "relationships", "users"
  add_foreign_key "used_ingredients", "ingredients"
  add_foreign_key "used_ingredients", "products"
end
