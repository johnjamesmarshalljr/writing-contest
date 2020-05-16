class ChangeDatePublishedInSubmissionTable < ActiveRecord::Migration
  def change
    change_column :submissions, :date_published, :string
  end
end
