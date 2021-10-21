class CreateDrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :drafts do |t|
      t.boolean :active, default: false
      t.references :season, null: false, foreign_key: true
      t.datetime :started_at
      t.jsonb :draft_order
      t.integer :active_drafter_id
      
      t.timestamps
    end
  end
end
