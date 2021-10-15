class RemoveLineFromTeams < ActiveRecord::Migration[5.2]
  def up
    remove_column :teams, :line
  end

  def down
    add_column :teams, :line, :float
  end
end
