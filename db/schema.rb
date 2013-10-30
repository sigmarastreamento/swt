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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131026234540) do

  create_table "application_settings", force: true do |t|
    t.boolean "registrationEnabled", null: false
  end

  create_table "devices", force: true do |t|
    t.string  "name"
    t.string  "uniqueId"
    t.integer "latestPosition_id", limit: 8
  end

  add_index "devices", ["latestPosition_id"], name: "FK5CF8ACDD7C6208C3", using: :btree

  create_table "positions", force: true do |t|
    t.string   "address"
    t.float    "altitude"
    t.float    "course"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "other"
    t.float    "power"
    t.float    "speed"
    t.datetime "time"
    t.boolean  "valid"
    t.integer  "device_id", limit: 8
  end

  add_index "positions", ["device_id", "time"], name: "positionsIndex", using: :btree
  add_index "positions", ["device_id"], name: "FK65C08C6ADB0C3B8A", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "user_settings", force: true do |t|
    t.string "speedUnit"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_devices", id: false, force: true do |t|
    t.integer "users_id",   limit: 8, null: false
    t.integer "devices_id", limit: 8, null: false
  end

  add_index "users_devices", ["devices_id"], name: "FK81E459A68294BA3", using: :btree
  add_index "users_devices", ["users_id"], name: "FK81E459A6712480D", using: :btree

  create_table "users_old", force: true do |t|
    t.boolean "admin"
    t.string  "login"
    t.string  "password"
    t.integer "userSettings_id", limit: 8
  end

  add_index "users_old", ["userSettings_id"], name: "FK6A68E0862018CAA", using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
