# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_808_181_842) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'order_details', force: :cascade do |t|
    t.bigint 'order_id', null: false
    t.bigint 'product_id', null: false
    t.integer 'quantity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_order_details_on_order_id'
    t.index ['product_id'], name: 'index_order_details_on_product_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.float 'total_amount'
    t.date 'date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'rider_id'
    t.index ['rider_id'], name: 'index_orders_on_rider_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.string 'category'
    t.string 'description'
    t.integer 'price'
    t.string 'image'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'instock'
    t.integer 'stock_count'
  end

  create_table 'reviews', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'rider_id'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'product_id'
    t.integer 'rating'
    t.index ['product_id'], name: 'index_reviews_on_product_id'
    t.index ['rider_id'], name: 'index_reviews_on_rider_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'riders', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'phone_number'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password_digest'
    t.boolean 'is_admin'
    t.string 'avatar'
    t.string 'bio'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email'
    t.string 'contact_info'
  end

  add_foreign_key 'order_details', 'orders'
  add_foreign_key 'order_details', 'products'
  add_foreign_key 'orders', 'riders'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'reviews', 'products'
  add_foreign_key 'reviews', 'riders'
  add_foreign_key 'reviews', 'users'
end
