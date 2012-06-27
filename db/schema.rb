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

ActiveRecord::Schema.define(:version => 20120624174713) do

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "orderlines", :force => true do |t|
    t.string   "sku"
    t.string   "name"
    t.string   "ean"
    t.integer  "qty_ordered"
    t.integer  "qty_delivered", :default => 0
    t.integer  "qty_invoiced",  :default => 0
    t.integer  "price"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "number"
    t.datetime "date"
    t.string   "state",      :default => "open"
    t.string   "payment"
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "address2"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "mail"
    t.string   "phone"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "productrelationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "productrelationships", ["followed_id"], :name => "index_productrelationships_on_followed_id"
  add_index "productrelationships", ["follower_id", "followed_id"], :name => "index_productrelationships_on_follower_id_and_followed_id", :unique => true
  add_index "productrelationships", ["follower_id"], :name => "index_productrelationships_on_follower_id"

  create_table "products", :force => true do |t|
    t.integer  "sku"
    t.string   "name"
    t.integer  "stock"
    t.integer  "price"
    t.integer  "ean"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "products", ["sku", "name", "ean"], :name => "index_products_on_sku_and_name_and_ean"

  create_table "purchaselines", :force => true do |t|
    t.string   "sku"
    t.string   "name"
    t.string   "ean"
    t.integer  "qty_purchased"
    t.integer  "qty_received"
    t.integer  "price"
    t.integer  "purchase_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "supplier_id"
    t.string   "state",           :default => "open"
    t.string   "delivery_number"
    t.string   "invoice_number"
    t.integer  "shipping_fee"
    t.datetime "date"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "supplierproducts", :force => true do |t|
    t.string   "sku"
    t.string   "name"
    t.integer  "stock"
    t.integer  "price"
    t.integer  "ean"
    t.integer  "supplier_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "supplierproducts", ["sku", "name", "ean"], :name => "index_supplierproducts_on_sku_and_name_and_ean"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address2"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "currency"
    t.string   "mail"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                  :default => false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "state"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
