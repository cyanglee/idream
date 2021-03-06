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

ActiveRecord::Schema.define(:version => 20111115030309) do

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.integer  "city_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["name"], :name => "index_districts_on_name"

  create_table "jobs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.string   "title"
    t.text     "desc"
    t.text     "location"
    t.text     "requirement"
    t.string   "contact"
    t.date     "begin_date"
    t.date     "end_date"
    t.time     "begin_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.string   "education"
    t.string   "period"
  end

  add_index "jobs", ["organization_id"], :name => "index_jobs_on_organization_id"
  add_index "jobs", ["title"], :name => "index_jobs_on_title"
  add_index "jobs", ["user_id"], :name => "index_jobs_on_user_id"

  create_table "organization_admins", :force => true do |t|
    t.integer  "user_id",                          :null => false
    t.integer  "organization_id",                  :null => false
    t.string   "status",          :default => "p", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_admins", ["organization_id"], :name => "index_organization_admins_on_organization_id"
  add_index "organization_admins", ["user_id", "organization_id"], :name => "index_organization_admins_on_user_id_and_organization_id", :unique => true
  add_index "organization_admins", ["user_id"], :name => "index_organization_admins_on_user_id"

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.text     "profile"
    t.string   "address"
    t.string   "district"
    t.string   "city"
    t.string   "zipcode"
    t.string   "category"
    t.string   "contact"
    t.integer  "creator"
    t.boolean  "active",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "webpage"
  end

  add_index "organizations", ["contact"], :name => "index_organizations_on_contact"
  add_index "organizations", ["creator"], :name => "index_organizations_on_creator"
  add_index "organizations", ["id"], :name => "index_organizations_on_id"
  add_index "organizations", ["name"], :name => "index_organizations_on_name"

  create_table "school_admin_jobs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.integer  "birth_year"
    t.string   "zip_code"
    t.boolean  "volunteer"
    t.boolean  "organization"
    t.boolean  "admin"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "degree"
    t.text     "skills"
    t.string   "gender"
  end

  add_index "users", ["admin"], :name => "index_users_on_admin"
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["organization"], :name => "index_users_on_organization"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["volunteer"], :name => "index_users_on_volunteer"

  create_table "volunteer_jobs", :force => true do |t|
    t.integer  "user_id",                     :null => false
    t.integer  "job_id",                      :null => false
    t.string   "status",     :default => "p", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volunteer_jobs", ["job_id"], :name => "index_volunteer_jobs_on_job_id"
  add_index "volunteer_jobs", ["user_id", "job_id"], :name => "index_volunteer_jobs_on_user_id_and_job_id", :unique => true
  add_index "volunteer_jobs", ["user_id"], :name => "index_volunteer_jobs_on_user_id"

end
