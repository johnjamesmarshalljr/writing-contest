class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :category
      t.string :author
      t.string :email
      t.datetime :date_published
      t.string :title
      t.string :article
    end
  end
end
