class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.references :contestant, foreign_key: true
      t.references :team, foreign_key: true
      t.boolean :over
      t.boolean :lock

      t.timestamps
    end
  end
end
