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

ActiveRecord::Schema.define(version: 2021_03_10_233828) do

  create_table "bingo_boards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bingo_hall_id"
    t.index ["bingo_hall_id"], name: "index_bingo_boards_on_bingo_hall_id"
  end

  create_table "bingo_halls", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "bingo_board_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bingo_board_id"], name: "index_players_on_bingo_board_id"
  end

  create_table "squares", force: :cascade do |t|
    t.boolean "clicked", default: false
    t.integer "bingo_board_id"
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bingo_board_id"], name: "index_squares_on_bingo_board_id"
  end

  add_foreign_key "bingo_boards", "bingo_halls"
  add_foreign_key "players", "bingo_boards"
end
