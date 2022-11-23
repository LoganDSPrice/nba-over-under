class ChangeActiveToDraftingEnabledOnLeagues < ActiveRecord::Migration[6.1]
  def change
    rename_column :leagues, :active, :drafting_enabled
  end
end
