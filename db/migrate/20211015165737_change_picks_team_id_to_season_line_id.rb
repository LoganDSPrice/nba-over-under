class ChangePicksTeamIdToSeasonLineId < ActiveRecord::Migration[5.2]
  def change
    remove_reference :picks, :team
    add_reference :picks, :season_line

    remove_reference :picks, :user
    add_reference :picks, :enrollment
  end
end
