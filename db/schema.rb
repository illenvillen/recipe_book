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

ActiveRecord::Schema.define(version: 2019_03_10_013406) do

  create_table "amounts", force: :cascade do |t|
    t.string "measurement"
    t.decimal "quantity"
  end

  create_table "course_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "cuisine_categories", force: :cascade do |t|
    t.string "name"
    t.integer "region_id"
    t.string "description"
  end

  create_table "ingredient_amounts", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "amount_id"
  end

  create_table "ingredient_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
  end

  create_table "recipe_courses", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "course_type_id"
  end

  create_table "recipe_cuisines", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "cuisine_category_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.decimal "prep_time"
    t.decimal "cook_time"
    t.string "difficulty"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "steps", force: :cascade do |t|
    t.string "step_text"
    t.integer "recipe_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.string "type"
  end

end
