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

ActiveRecord::Schema[7.0].define(version: 2023_09_19_151118) do
  create_table "cook_book_recipes", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cook_book_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cook_book_id"], name: "index_cook_book_recipes_on_cook_book_id"
    t.index ["recipe_id"], name: "index_cook_book_recipes_on_recipe_id"
  end

  create_table "cook_books", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "location"
    t.integer "price", default: 0
    t.integer "type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_materials", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "material_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_recipe_materials_on_material_id"
    t.index ["recipe_id"], name: "index_recipe_materials_on_recipe_id"
  end

  create_table "recipes", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price", default: 0
    t.integer "type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cook_book_recipes", "cook_books"
  add_foreign_key "cook_book_recipes", "recipes"
  add_foreign_key "recipe_materials", "materials"
  add_foreign_key "recipe_materials", "recipes"
end
