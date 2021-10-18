class RemoveLockFromPicks < ActiveRecord::Migration[6.1]
  def change
    remove_column :picks, :lock, :boolean, default: false
  end
end
