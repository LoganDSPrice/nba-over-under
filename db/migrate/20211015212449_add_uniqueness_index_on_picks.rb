class AddUniquenessIndexOnPicks < ActiveRecord::Migration[5.2]
  def change
    add_index :picks, [:season_line_id, :enrollment_id], unique: true
  end
end
