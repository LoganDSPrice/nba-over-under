class RenamePickContestantToUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :picks, :contestant_id, :user_id
  end
end
