class AddMemberIdToSubmissionsTable < ActiveRecord::Migration
  def change
    add_column :submissions, :member_id, :integer
  end
end
