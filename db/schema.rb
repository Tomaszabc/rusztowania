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

ActiveRecord::Schema[7.0].define(version: 20_231_127_104_530) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource'
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'cars', force: :cascade do |t|
    t.string 'plate_number'
    t.string 'model'
    t.integer 'number'
    t.string 'actual_driver'
    t.boolean 'active'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'cart_items', force: :cascade do |t|
    t.bigint 'part_id', null: false
    t.bigint 'cart_id', null: false
    t.integer 'quantity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['cart_id'], name: 'index_cart_items_on_cart_id'
    t.index ['part_id'], name: 'index_cart_items_on_part_id'
  end

  create_table 'carts', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'deleted_at'
    t.index ['deleted_at'], name: 'index_categories_on_deleted_at'
  end

  create_table 'delivery_emails', force: :cascade do |t|
    t.string 'recipient_email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'order_lists', force: :cascade do |t|
    t.bigint 'order_id', null: false
    t.bigint 'part_id', null: false
    t.integer 'quantity'
    t.string 'description'
    t.decimal 'weight'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'delivery_quantity'
    t.boolean 'checkbox'
    t.index ['order_id'], name: 'index_order_lists_on_order_id'
    t.index ['part_id'], name: 'index_order_lists_on_part_id'
  end

  create_table 'order_storage_lists', force: :cascade do |t|
    t.bigint 'order_id', null: false
    t.bigint 'part_id', null: false
    t.integer 'quantity'
    t.text 'description'
    t.decimal 'weight'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'checkbox', default: false
    t.index ['order_id'], name: 'index_order_storage_lists_on_order_id'
    t.index ['part_id'], name: 'index_order_storage_lists_on_part_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.string 'building_site'
    t.date 'delivery_date'
    t.text 'info'
    t.string 'part_number'
    t.string 'part_description'
    t.integer 'quantity'
    t.decimal 'weight'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.string 'car_number'
    t.text 'building_site_info'
    t.date 'new_delivery_date'
    t.string 'status'
    t.text 'storage_info'
    t.boolean 'hidden', default: false
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'part_categories', force: :cascade do |t|
    t.bigint 'part_id', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_part_categories_on_category_id'
    t.index ['part_id'], name: 'index_part_categories_on_part_id'
  end

  create_table 'part_systems', force: :cascade do |t|
    t.bigint 'part_id'
    t.bigint 'system_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['part_id'], name: 'index_part_systems_on_part_id'
    t.index ['system_id'], name: 'index_part_systems_on_system_id'
  end

  create_table 'parts', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.decimal 'weight'
    t.integer 'multipack'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'deleted_at'
    t.index ['deleted_at'], name: 'index_parts_on_deleted_at'
  end

  create_table 'sites', force: :cascade do |t|
    t.text 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'address'
    t.datetime 'deleted_at'
    t.bigint 'ledermann_id'
    t.index ['deleted_at'], name: 'index_sites_on_deleted_at'
    t.index ['ledermann_id'], name: 'index_sites_on_ledermann_id'
  end

  create_table 'systems', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'deleted_at'
    t.index ['deleted_at'], name: 'index_systems_on_deleted_at'
  end

  create_table 'trip_trackings', force: :cascade do |t|
    t.bigint 'car_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'start_time'
    t.datetime 'finish_time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['car_id'], name: 'index_trip_trackings_on_car_id'
    t.index ['user_id'], name: 'index_trip_trackings_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.string 'status', default: 'scaffolder'
    t.datetime 'deleted_at'
    t.index ['deleted_at'], name: 'index_users_on_deleted_at'
    t.index ['email'], name: 'index_users_on_email', unique: true, where: '(deleted_at IS NULL)'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'cart_items', 'carts'
  add_foreign_key 'cart_items', 'parts'
  add_foreign_key 'order_lists', 'orders'
  add_foreign_key 'order_lists', 'parts'
  add_foreign_key 'order_storage_lists', 'orders'
  add_foreign_key 'order_storage_lists', 'parts'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'part_categories', 'categories'
  add_foreign_key 'part_categories', 'parts'
  add_foreign_key 'part_systems', 'parts'
  add_foreign_key 'part_systems', 'systems'
  add_foreign_key 'sites', 'users', column: 'ledermann_id'
  add_foreign_key 'trip_trackings', 'cars'
  add_foreign_key 'trip_trackings', 'users'
end
