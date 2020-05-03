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

ActiveRecord::Schema.define(version: 2020_05_03_045959) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.float "kabuka"
    t.float "riron_kabuka"
    t.float "haitou_rimawari"
    t.float "yutai_rimawari"
    t.float "uriagedaka"
    t.float "eigyou_rieki"
    t.float "pbr"
    t.float "jikoshihon_ritsu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "eiri_ritu"
    t.float "goukei_rimawari"
    t.float "wariyasudo"
  end

end
