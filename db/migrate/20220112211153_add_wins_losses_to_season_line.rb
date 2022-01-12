class AddWinsLossesToSeasonLine < ActiveRecord::Migration[6.1]
  def change
    add_column :season_lines, :wins, :integer, default: 0
    add_column :season_lines, :losses, :integer, default: 0
  end
end
