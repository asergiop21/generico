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

ActiveRecord::Schema.define(:version => 20140702120734) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.decimal  "price_cost",             :precision => 8, :scale => 2
    t.decimal  "percentaje"
    t.decimal  "price_total",            :precision => 8, :scale => 2
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.decimal  "quantity",               :precision => 8, :scale => 2
    t.string   "barcode"
    t.string   "articles_code_supplier"
    t.integer  "supplier_id"
    t.integer  "category_id"
    t.integer  "make_id"
    t.string   "name_supplier"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "address"
    t.string   "neighborhood"
    t.string   "reference_direction"
    t.string   "email"
    t.string   "dni"
    t.text     "description"
    t.string   "cuit"
    t.date     "date_of_birth"
    t.boolean  "removed"
    t.string   "bar_code"
    t.string   "category"
    t.integer  "location_id"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "equipments", :force => true do |t|
    t.string   "mac"
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "model_id"
    t.integer  "supplier_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "status",      :default => "STOCK"
    t.boolean  "enabled",     :default => true
  end

  create_table "invoices", :force => true do |t|
    t.integer  "customer_id"
    t.decimal  "price_total"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "current_account",  :default => false
    t.boolean  "cancelar_invoice", :default => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "departament"
    t.string   "zipcode"
    t.string   "province"
    t.string   "country"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "makes", :force => true do |t|
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "name"
    t.string   "comment"
    t.integer  "make_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id", :null => false
  end

  add_index "models", ["category_id"], :name => "index_models_on_category_id"

  create_table "orders", :force => true do |t|
    t.integer  "article_id"
    t.decimal  "quantity"
    t.decimal  "unit_price"
    t.decimal  "price_total"
    t.integer  "invoice_id"
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
    t.string   "name"
    t.decimal  "discount",    :precision => 8, :scale => 2, :default => 0.0
  end

  create_table "payments", :force => true do |t|
    t.integer  "invoice_id"
    t.string   "description"
    t.decimal  "amount"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "customer_id"
  end

  create_table "phones", :force => true do |t|
    t.string   "phone_number"
    t.string   "phone_prefix"
    t.string   "phone"
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "phones", ["customer_id"], :name => "index_phones_on_customer_id"
  add_index "phones", ["user_id"], :name => "index_phones_on_user_id"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
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
    t.string   "username"
    t.string   "lastname"
    t.string   "name"
    t.string   "address"
    t.integer  "role_id"
    t.string   "cuit"
    t.string   "dni"
    t.boolean  "enabled"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"

end
