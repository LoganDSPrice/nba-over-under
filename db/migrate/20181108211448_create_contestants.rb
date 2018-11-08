class CreateContestants < ActiveRecord::Migration[5.2]
  def change
    create_table :contestants do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
