ActiveRecord::Schema.define(version: 20200515213207) do

  create_table "submissions", force: :cascade do |t|
    t.integer  "category"
    t.string   "author"
    t.string   "email"
    t.datetime "date_published"
    t.string   "title"
    t.string   "article"
  end

  create_table "members", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
