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

ActiveRecord::Schema[7.2].define(version: 2024_11_13_191700) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", primary_key: ["api_version", "value"], force: :cascade do |t|
    t.string "value", null: false
    t.integer "api_version", null: false
    t.boolean "enabled", default: true
    t.bigint "subscription_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_version", "value"], name: "index_api_keys_on_api_version_and_value", unique: true
    t.index ["subscription_plan_id"], name: "index_api_keys_on_subscription_plan_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "api_version", null: false
    t.string "controller", null: false
    t.string "action", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller", "action"], name: "index_permissions_on_controller_and_action", unique: true
  end

  create_table "permissions_subscription_plans", id: false, force: :cascade do |t|
    t.bigint "subscription_plan_id", null: false
    t.bigint "permission_id", null: false
    t.index ["permission_id"], name: "index_permissions_subscription_plans_on_permission_id"
    t.index ["subscription_plan_id"], name: "index_permissions_subscription_plans_on_subscription_plan_id"
  end

  create_table "subscription_plans", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "forecast_days", null: false
  end
end
