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

ActiveRecord::Schema.define(version: 2019_10_22_115031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "labelings", force: :cascade do |t|
    t.bigint "label_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_labelings_on_label_id"
    t.index ["task_id"], name: "index_labelings_on_task_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "usr_id"
    t.string "content"
    t.index ["usr_id"], name: "index_labels_on_usr_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.date "expired_date", default: "2019-10-20"
    t.integer "priority", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.bigint "usr_id"
    t.index ["usr_id"], name: "index_tasks_on_usr_id"
  end

  create_table "tasks_labels", force: :cascade do |t|
    t.bigint "label_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_tasks_labels_on_label_id"
    t.index ["task_id"], name: "index_tasks_labels_on_task_id"
  end

  create_table "usrs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "confirm_password"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "labelings", "labels"
  add_foreign_key "labelings", "tasks"
  add_foreign_key "labels", "usrs"
  add_foreign_key "tasks", "usrs"
  add_foreign_key "tasks_labels", "labels"
  add_foreign_key "tasks_labels", "tasks"
end
