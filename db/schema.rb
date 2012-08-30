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

ActiveRecord::Schema.define(:version => 20120830090000) do

  create_table "contacts", :force => true do |t|
    t.string   "lastname",   :null => false
    t.string   "firstname",  :null => false
    t.string   "email"
    t.string   "tel_home"
    t.string   "tel_mobil"
    t.string   "adress"
    t.integer  "state_id"
    t.integer  "type_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contacts", ["state_id"], :name => "index_state_on_contacts", :unique => true
  add_index "contacts", ["type_id"], :name => "index_type_on_contacts", :unique => true

  create_table "countries", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "title",      :null => false
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["user_id"], :name => "index_users_on_items", :unique => true

  create_table "notifications", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.string   "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "item_id"
    t.integer  "type_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "pictures", ["item_id"], :name => "index_items_on_pictures", :unique => true
  add_index "pictures", ["type_id"], :name => "index_types_on_pictures", :unique => true

  create_table "states", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "states", ["country_id"], :name => "index_countries_on_states"

  create_table "types", :force => true do |t|
    t.datetime "date_at"
    t.datetime "date_to"
    t.text     "descriptif"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "types", ["item_id"], :name => "index_types_on_items", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",                                                                 :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",                 :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email",                                 :default => "email@server.com"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
  end

end
