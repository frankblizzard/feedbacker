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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110414120030) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "image_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "internal"
  end

  create_table "hours", :force => true do |t|
    t.date     "date"
    t.float    "amount"
    t.text     "task"
    t.boolean  "extra"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "work_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "holiday"
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rendering_file_name"
    t.string   "rendering_content_type"
    t.integer  "rendering_file_size"
    t.datetime "rendering_updated_at"
    t.integer  "user_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "started_at"
    t.datetime "ends_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company"
    t.boolean  "admin"
  end

  create_table "work_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
