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

ActiveRecord::Schema.define(:version => 20110812090001) do

  create_table "announcements", :force => true do |t|
    t.text     "message"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "survey_id"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chat_messages", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "client_nr"
    t.string   "full_name"
    t.string   "web"
    t.text     "notes"
  end

  create_table "comments", :force => true do |t|
    t.integer  "image_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "internal"
  end

  create_table "fixed_costs", :force => true do |t|
    t.string   "name"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
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

  create_table "key_datas", :force => true do |t|
    t.string   "name"
    t.float    "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "city"
    t.integer  "zipcode"
    t.date     "birthday"
    t.string   "phone"
    t.string   "avatar"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "user_id"
    t.string   "email"
  end

  create_table "plan_hours", :force => true do |t|
    t.float    "amount"
    t.integer  "project_id"
    t.integer  "work_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.date     "started_at"
    t.date     "ends_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "project_nr"
    t.integer  "client_id"
    t.boolean  "hidden",      :default => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "survey_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id"
  end

  create_table "user_plan_hours", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.float    "amount"
    t.float    "individual_costs"
    t.float    "burden_costs"
    t.float    "total_costs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company"
    t.boolean  "admin"
    t.boolean  "project_manager"
    t.integer  "created_by"
    t.string   "full_name"
    t.boolean  "works_at_eve",    :default => false
    t.integer  "client_id"
    t.boolean  "controller"
    t.float    "hourly_rate"
    t.boolean  "accountant",      :default => false
    t.boolean  "deactivated",     :default => false, :null => false
  end

  create_table "work_categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
