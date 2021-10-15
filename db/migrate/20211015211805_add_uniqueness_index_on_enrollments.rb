class AddUniquenessIndexOnEnrollments < ActiveRecord::Migration[5.2]
  def change
    add_index :enrollments, [:user_id, :season_id], unique: true
  end
end
