class RenameDraftsToLeagues < ActiveRecord::Migration[6.1]
  def change
    rename_table :drafts, :leagues
  end
end
