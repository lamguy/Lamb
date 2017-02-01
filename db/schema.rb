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

ActiveRecord::Schema.define(version: 20170201162112) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "trackable_type"
    t.integer  "trackable_id"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "key"
    t.text     "parameters",     limit: 65535
    t.string   "recipient_type"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree
  end

  create_table "follows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "followable_type",                 null: false
    t.integer  "followable_id",                   null: false
    t.string   "follower_type",                   null: false
    t.integer  "follower_id",                     null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id", using: :btree
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower_type_and_follower_id", using: :btree
  end

  create_table "milestones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "description"
    t.date     "due"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_milestones_on_project_id", using: :btree
  end

  create_table "personal_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "setting_key",   null: false
    t.string   "setting_value", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["setting_key"], name: "index_personal_settings_on_setting_key", using: :btree
    t.index ["setting_value"], name: "index_personal_settings_on_setting_value", using: :btree
    t.index ["user_id"], name: "index_personal_settings_on_user_id", using: :btree
  end

  create_table "project_teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id"
    t.integer  "team_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_teams_on_project_id", using: :btree
    t.index ["role_id"], name: "index_project_teams_on_role_id", using: :btree
    t.index ["team_id"], name: "index_project_teams_on_team_id", using: :btree
  end

  create_table "project_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_users_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       default: "", null: false
    t.integer  "status",     default: 1,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "power",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "task_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.string   "file_name"
    t.string   "file_content_type"
    t.string   "file_size"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["task_id"], name: "index_task_assets_on_task_id", using: :btree
    t.index ["user_id"], name: "index_task_assets_on_user_id", using: :btree
  end

  create_table "task_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["task_id"], name: "index_task_comments_on_task_id", using: :btree
    t.index ["user_id"], name: "index_task_comments_on_user_id", using: :btree
  end

  create_table "task_meta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id"
    t.string   "name"
    t.string   "label"
    t.string   "default_value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["project_id"], name: "index_task_meta_on_project_id", using: :btree
  end

  create_table "task_meta_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "task_meta_id"
    t.string   "value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["task_meta_id"], name: "index_task_meta_data_on_task_meta_id", using: :btree
    t.index ["value"], name: "index_task_meta_data_on_value", using: :btree
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "project_id"
    t.string   "name"
    t.text     "description",         limit: 65535
    t.integer  "assigner_id"
    t.integer  "assignee_id"
    t.date     "due"
    t.integer  "priority",                          default: 0, null: false
    t.integer  "task_comments_count",               default: 0
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "milestone_id"
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id", using: :btree
    t.index ["assigner_id"], name: "index_tasks_on_assigner_id", using: :btree
    t.index ["milestone_id"], name: "index_tasks_on_milestone_id", using: :btree
    t.index ["project_id"], name: "index_tasks_on_project_id", using: :btree
  end

  create_table "team_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_team_members_on_role_id", using: :btree
    t.index ["team_id"], name: "index_team_members_on_team_id", using: :btree
    t.index ["user_id"], name: "index_team_members_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
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

  add_foreign_key "milestones", "projects"
  add_foreign_key "personal_settings", "users"
  add_foreign_key "project_teams", "projects"
  add_foreign_key "project_teams", "roles"
  add_foreign_key "project_teams", "teams"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "task_assets", "tasks"
  add_foreign_key "task_assets", "users"
  add_foreign_key "task_comments", "tasks"
  add_foreign_key "task_comments", "users"
  add_foreign_key "task_meta", "projects"
  add_foreign_key "task_meta_data", "task_meta", column: "task_meta_id"
  add_foreign_key "tasks", "milestones"
  add_foreign_key "tasks", "projects"
end
