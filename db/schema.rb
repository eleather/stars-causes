# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120624184400) do

  create_table "comments", :force => true do |t|
    t.string   "body"
    t.integer  "author_id"
    t.integer  "star_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seconds", :force => true do |t|
    t.integer  "star_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seconds", ["star_id", "user_id"], :name => "index_seconds_on_star_id_and_user_id", :unique => true

  create_table "stars", :force => true do |t|
    t.integer  "from_id"
    t.string   "reason",     :limit => 1024
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "star_type",                  :default => "standard", :null => false
  end

  create_table "stars_users", :id => false, :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "star_id", :null => false
  end

  add_index "stars_users", ["star_id"], :name => "index_stars_users_on_star_id"
  add_index "stars_users", ["user_id"], :name => "index_stars_users_on_user_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["name"], :name => "index_teams_on_name", :unique => true

  create_table "teams_users", :id => false, :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "team_id", :null => false
  end

  add_index "teams_users", ["team_id"], :name => "index_teams_users_on_team_id"
  add_index "teams_users", ["user_id"], :name => "index_teams_users_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.decimal  "facebook_uid"
    t.string   "facebook_session_key"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",               :default => true
    t.string   "crypted_password"
    t.string   "password_salt"
  end

end
