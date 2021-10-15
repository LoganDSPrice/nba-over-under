class CreateSeasonLines < ActiveRecord::Migration[5.2]
  def change
    create_table :season_lines do |t|
      t.references :team, foreign_key: true
      t.references :season, foreign_key: true
      t.float :projected_wins
      t.float :line

      t.timestamps
    end
  end
end
