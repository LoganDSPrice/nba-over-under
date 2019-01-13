class AddProjectedWinsToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :projected_wins, :float
  end
end
