class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.integer :contestant_id
      t.integer :team_id
      t.boolean :over
      t.boolean :lock

      t.timestamps
    end
  end
end
