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

ActiveRecord::Schema.define(version: 20200408031729) do

  create_table "cart_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "carts_id"
    t.bigint "products_id"
    t.decimal "price", precision: 10
    t.integer "quantity"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carts_id"], name: "index_cart_items_on_carts_id"
    t.index ["products_id"], name: "index_cart_items_on_products_id"
  end

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "users_id"
    t.text "address_ship"
    t.integer "shipper_id"
    t.datetime "date_ship"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_carts_on_users_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "thumbnails_id"
    t.bigint "categories_id"
    t.bigint "comments_id"
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 10
    t.integer "quantity"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_products_on_categories_id"
    t.index ["comments_id"], name: "index_products_on_comments_id"
    t.index ["thumbnails_id"], name: "index_products_on_thumbnails_id"
  end

  create_table "thumbnails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.text "address"
    t.integer "role"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cart_items", "carts", column: "carts_id"
  add_foreign_key "cart_items", "products", column: "products_id"
  add_foreign_key "carts", "users", column: "users_id"
  add_foreign_key "products", "categories", column: "categories_id"
  add_foreign_key "products", "comments", column: "comments_id"
  add_foreign_key "products", "thumbnails", column: "thumbnails_id"
end
