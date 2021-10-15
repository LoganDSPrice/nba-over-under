class CreateLocks < ActiveRecord::Migration[5.2]
  def change
    create_table :locks do |t|
      t.references :pick, foreign_key: true

      t.timestamps
    end
  end
end
