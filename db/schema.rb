ActiveRecord::Schema[7.0].define(version: 2022_09_20_091912) do
  create_table "urls", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count", default: 0
    t.string "website_name"
    t.index ["slug"], name: "index_urls_on_slug", unique: true
  end

end
