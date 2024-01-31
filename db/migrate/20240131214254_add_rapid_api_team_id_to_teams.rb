class AddRapidApiTeamIdToTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :rapid_api_team_id, :integer
  end
end
