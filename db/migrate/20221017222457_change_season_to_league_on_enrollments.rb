class ChangeSeasonToLeagueOnEnrollments < ActiveRecord::Migration[6.1]
  def up
    remove_foreign_key :enrollments, :seasons
    rename_column :enrollments, :season_id, :league_id
    add_foreign_key :enrollments, :leagues
  end
  
  def down
    remove_foreign_key :enrollments, :leagues
    rename_column :enrollments, :league_id, :season_id
    add_foreign_key :enrollments, :seasons
  end
end
