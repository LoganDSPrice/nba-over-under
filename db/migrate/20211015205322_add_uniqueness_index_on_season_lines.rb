class AddUniquenessIndexOnSeasonLines < ActiveRecord::Migration[5.2]
  def change
    add_index :season_lines, [:team_id, :season_id], unique: true
  end
end
