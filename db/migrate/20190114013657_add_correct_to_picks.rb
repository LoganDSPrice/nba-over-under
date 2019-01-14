class AddCorrectToPicks < ActiveRecord::Migration[5.2]
  def change
    add_column :picks, :correct, :boolean
  end
end
