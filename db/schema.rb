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

ActiveRecord::Schema.define(version: 20170123195359) do

  create_table "project_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_users_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_meta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "label"
    t.string   "default_value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["project_id"], name: "index_task_meta_on_project_id", using: :btree
  end

  create_table "task_meta_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "task_meta_id"
    t.string   "value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["task_meta_id"], name: "index_task_meta_data_on_task_meta_id", using: :btree
    t.index ["value"], name: "index_task_meta_data_on_value", using: :btree
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "project_id"
    t.string   "name"
    t.integer  "assigner_id"
    t.integer  "assignee_id"
    t.date     "due"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id", using: :btree
    t.index ["assigner_id"], name: "index_tasks_on_assigner_id", using: :btree
    t.index ["project_id"], name: "index_tasks_on_project_id", using: :btree
  end

  create_table "team_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_team_members_on_role_id", using: :btree
    t.index ["team_id"], name: "index_team_members_on_team_id", using: :btree
    t.index ["user_id"], name: "index_team_members_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "task_meta", "projects"
  add_foreign_key "task_meta_data", "task_meta", column: "task_meta_id"
  add_foreign_key "tasks", "projects"
end
