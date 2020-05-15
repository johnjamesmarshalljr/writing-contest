class CreateMembers < ActiveRecord::Migration
  def change
    create_table "members", force: :cascade do |t|
      t.string   "email"
      t.string   "password"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
