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

ActiveRecord::Schema.define(:version => 20140425034304) do

  create_table "alerts", :force => true do |t|
    t.string   "description"
    t.integer  "user_id"
    t.integer  "neighborhood_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "alerts", ["neighborhood_id"], :name => "index_alerts_on_neighborhood_id"
  add_index "alerts", ["user_id"], :name => "index_alerts_on_user_id"

  create_table "attendances", :force => true do |t|
    t.string   "attendance"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "attendances", ["event_id"], :name => "index_attendances_on_event_id"
  add_index "attendances", ["user_id"], :name => "index_attendances_on_user_id"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["country_id"], :name => "index_cities_on_country_id"

  create_table "comments", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["event_id"], :name => "index_comments_on_event_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.date     "date_event"
    t.time     "time_event"
    t.string   "place"
    t.integer  "user_id"
    t.integer  "neighborhood_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "events", ["neighborhood_id"], :name => "index_events_on_neighborhood_id"
  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "neighborhoods", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "neighborhoods", ["city_id"], :name => "index_neighborhoods_on_city_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "gender"
    t.string   "type_user"
    t.integer  "neighborhood_id"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["neighborhood_id"], :name => "index_users_on_neighborhood_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end