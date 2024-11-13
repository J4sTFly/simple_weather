class AddUniqueIndexToPermissions < ActiveRecord::Migration[7.2]
  def change
    add_index :permissions, [ :controller, :action ], unique: true
  end
end
