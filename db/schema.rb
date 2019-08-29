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

ActiveRecord::Schema.define(version: 2019_08_29_212128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "zipcode"
    t.bigint "state_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "county_id"
    t.index ["company_id"], name: "index_addresses_on_company_id"
    t.index ["county_id"], name: "index_addresses_on_county_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "analists", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.bigint "regional_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job"
    t.integer "occupation"
    t.index ["regional_id"], name: "index_analists_on_regional_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "fantasy"
    t.string "code_cnpj"
    t.integer "sap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "regional_id"
    t.index ["name"], name: "index_companies_on_name"
    t.index ["regional_id"], name: "index_companies_on_regional_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.date "date"
    t.text "description"
    t.bigint "company_id"
    t.bigint "analist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact_type"
    t.index ["analist_id"], name: "index_contacts_on_analist_id"
    t.index ["company_id"], name: "index_contacts_on_company_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ibge_meso"
    t.string "ibge_micro"
    t.integer "ibge_county_code"
    t.index ["state_id"], name: "index_counties_on_state_id"
  end

  create_table "phone_numbers", force: :cascade do |t|
    t.string "number"
    t.integer "type"
    t.bigint "phone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_id"], name: "index_phone_numbers_on_phone_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "name_contact"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["company_id"], name: "index_phones_on_company_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "isp"
    t.integer "service"
    t.float "band"
    t.float "value"
    t.text "comment"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.date "renewal_date"
    t.string "origin"
    t.string "destiny"
    t.index ["company_id"], name: "index_purchases_on_company_id"
  end

  create_table "regionals", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "initials"
  end

  create_table "states", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "companies"
  add_foreign_key "addresses", "counties"
  add_foreign_key "addresses", "states"
  add_foreign_key "analists", "regionals"
  add_foreign_key "companies", "regionals"
  add_foreign_key "contacts", "analists"
  add_foreign_key "contacts", "companies"
  add_foreign_key "counties", "states"
  add_foreign_key "phone_numbers", "phones"
  add_foreign_key "phones", "companies"
  add_foreign_key "purchases", "companies"
end
