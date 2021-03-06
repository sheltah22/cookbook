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

ActiveRecord::Schema.define(version: 2019_10_26_174855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dish_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods_varieties", id: false, force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "variety_id", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "food_id"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "measurement_id"
    t.index ["food_id"], name: "index_ingredients_on_food_id"
    t.index ["measurement_id"], name: "index_ingredients_on_measurement_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "variety_id"
    t.index ["variety_id"], name: "index_measurements_on_variety_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dish_type_id"
    t.index ["dish_type_id"], name: "index_recipes_on_dish_type_id"
    t.index ["user_id", "created_at"], name: "index_recipes_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "varieties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredients", "foods"
  add_foreign_key "ingredients", "measurements"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "measurements", "varieties"
  add_foreign_key "recipes", "dish_types"
  add_foreign_key "recipes", "users"
end
