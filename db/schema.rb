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

ActiveRecord::Schema.define(:version => 20130215153819) do

  create_table "contacts", :force => true do |t|
    t.string   "lastname",   :null => false
    t.string   "firstname",  :null => false
    t.string   "email"
    t.string   "tel_home"
    t.string   "tel_mobil"
    t.string   "adress"
    t.string   "country",    :null => false
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "region"
  end

  add_index "contacts", ["user_id"], :name => "index_users_on_contacts"

  create_table "friends", :force => true do |t|
    t.boolean  "follow",        :default => false
    t.boolean  "friend",        :default => false
    t.integer  "user_id"
    t.boolean  "accept_friend", :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "cancel",        :default => false, :null => false
  end

  add_index "friends", ["user_id"], :name => "index_user_on_friends"

  create_table "friends_users", :force => true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  add_index "friends_users", ["friend_id"], :name => "index_friend_on_friend_users"
  add_index "friends_users", ["user_id"], :name => "index_users_on_friend_users"

  create_table "items", :force => true do |t|
    t.string   "title",      :null => false
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["user_id"], :name => "index_users_on_items"

  create_table "notifications", :force => true do |t|
    t.datetime "date_at",    :null => false
    t.integer  "type_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "notifications", ["type_id"], :name => "index_notifications_on_types", :unique => true

  create_table "pictures", :force => true do |t|
    t.string   "picture"
    t.string   "cached_path"
    t.integer  "position",    :default => 0
    t.integer  "item_id"
    t.integer  "type_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "pictures", ["item_id"], :name => "index_items_on_pictures"
  add_index "pictures", ["type_id"], :name => "index_types_on_pictures"

  create_table "provided_dates", :force => true do |t|
    t.datetime "date_at"
    t.datetime "date_to"
    t.boolean  "date_to_activation", :default => true
    t.integer  "contact_id"
    t.integer  "item_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "provided_dates", ["contact_id"], :name => "index_provided_dated_on_contacts"
  add_index "provided_dates", ["item_id"], :name => "index_provided_dated_on_items"

  create_table "types", :force => true do |t|
    t.text     "descriptif"
    t.integer  "item_id"
    t.integer  "contact_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "types", ["contact_id"], :name => "index_types_on_contacts"
  add_index "types", ["item_id"], :name => "index_types_on_items"

  create_table "users", :force => true do |t|
    t.string   "login",                                  :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
