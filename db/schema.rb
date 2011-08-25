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

ActiveRecord::Schema.define(:version => 20110825133020) do

  create_table "assets", :force => true do |t|
    t.integer  "site_id"
    t.integer  "theme_id"
    t.string   "name"
    t.string   "type"
    t.text     "content"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["name"], :name => "index_assets_on_name"
  add_index "assets", ["site_id"], :name => "index_assets_on_site_id"
  add_index "assets", ["theme_id"], :name => "index_assets_on_theme_id"
  add_index "assets", ["type"], :name => "index_assets_on_type"

  create_table "pages", :force => true do |t|
    t.integer  "site_id"
    t.string   "title"
    t.string   "slug"
    t.integer  "author_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["author_id"], :name => "index_pages_on_author_id"
  add_index "pages", ["site_id"], :name => "index_pages_on_site_id"
  add_index "pages", ["slug"], :name => "index_pages_on_slug"

# Could not dump table "sites" because of following StandardError
#   Unknown type 'belongs_to' for column 'current_theme_id'

  create_table "themes", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.text     "description"
    t.string   "directory"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "themes", ["site_id"], :name => "index_themes_on_site_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "display_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
