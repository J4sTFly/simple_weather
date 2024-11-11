class CreatePermissions < ActiveRecord::Migration[7.2]
  def change
    create_table :permissions do |t|
      t.integer :api_version, null: false
      t.string :controller, null: false
      t.string :action, null: false
      t.timestamps
    end
  end
end
