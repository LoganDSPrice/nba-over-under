class ChangeContestantsToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :contestants, :users
  end
end
