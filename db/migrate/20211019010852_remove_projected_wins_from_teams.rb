class RemoveProjectedWinsFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :projected_wins, :float
  end
end
