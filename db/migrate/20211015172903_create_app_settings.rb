class CreateAppSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :app_settings do |t|
      t.integer :locks_limit, default: 3

      t.timestamps
    end
  end
end
