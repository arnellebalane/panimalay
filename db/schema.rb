# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130909162046) do

  create_table "accountabilities", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "due_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "announcements", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "content"
    t.string   "privacy"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "attendances", :force => true do |t|
    t.date     "attendance_date",                   :null => false
    t.boolean  "present",         :default => true
    t.integer  "users_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "conversation_members", :force => true do |t|
    t.integer  "users_id"
    t.integer  "conversations_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "conversations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "devices", :force => true do |t|
    t.string   "name",       :null => false
    t.decimal  "charge",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "document_dates", :force => true do |t|
    t.datetime "document_date"
    t.text     "remarks"
    t.integer  "documents_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "filename"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "event_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_comments", :force => true do |t|
    t.text     "content"
    t.integer  "users_id",   :null => false
    t.integer  "events_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title",                                        :null => false
    t.text     "description"
    t.string   "venue",               :default => "Dormitory"
    t.datetime "event_date"
    t.integer  "event_categories_id",                          :null => false
    t.integer  "users_id",                                     :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "gatepass_users", :force => true do |t|
    t.integer  "gatepasses_id"
    t.integer  "users_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "gatepasses", :force => true do |t|
    t.datetime "gatepass_date", :null => false
    t.text     "purpose"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "message_notifications", :force => true do |t|
    t.integer  "users_id"
    t.integer  "messages_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.integer  "conversations_id"
    t.integer  "users_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "photo_comments", :force => true do |t|
    t.text     "content"
    t.integer  "photos_id",  :null => false
    t.integer  "users_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "filename"
    t.text     "caption"
    t.integer  "users_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "properties", :force => true do |t|
    t.string   "name",                         :null => false
    t.integer  "quantity",      :default => 1
    t.integer  "working_units"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "property_logs", :force => true do |t|
    t.string   "borrower",      :null => false
    t.datetime "date_borrowed"
    t.datetime "date_returned"
    t.text     "purpose"
    t.integer  "properties_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "property_remarks", :force => true do |t|
    t.text     "content"
    t.integer  "properties_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "user_accountabilities", :force => true do |t|
    t.string   "status"
    t.integer  "users_id"
    t.integer  "accountabilities_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "user_devices", :force => true do |t|
    t.text     "description"
    t.integer  "quantity",    :default => 1
    t.integer  "users_id",                   :null => false
    t.integer  "devices_id",                 :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "user_infos", :force => true do |t|
    t.string   "student_number",                                                           :null => false
    t.string   "firstname",                                                                :null => false
    t.string   "lastname",                                                                 :null => false
    t.string   "nickname"
    t.string   "course"
    t.date     "birthday"
    t.string   "contact_number"
    t.string   "address"
    t.string   "fathername"
    t.string   "mothername"
    t.string   "elementary"
    t.string   "secondary"
    t.string   "college",                :default => "University of the Philippines Cebu"
    t.string   "bracket"
    t.integer  "year"
    t.string   "guardianname"
    t.string   "guardianaddress"
    t.string   "guardiancontact_number"
    t.integer  "user_id",                                                                  :null => false
    t.integer  "photo_id"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
  end

  add_index "user_infos", ["user_id"], :name => "index_user_infos_on_user_id"

  create_table "user_logs", :force => true do |t|
    t.string   "destination"
    t.datetime "date_out"
    t.datetime "date_in"
    t.integer  "users_id",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",      :null => false
    t.string   "password",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end