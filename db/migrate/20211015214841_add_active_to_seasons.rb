class AddActiveToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :active, :boolean, default: false
  end
end
