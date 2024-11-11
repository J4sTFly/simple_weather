class CreateApiKeys < ActiveRecord::Migration[7.2]
  def change
    create_table :api_keys, primary_key: [ :api_version, :value ] do |t|
      t.string :value, null: false
      t.integer :api_version, null: false
      t.boolean :enabled, default: true
      t.references :subscription_plan
      t.timestamps

      t.index [ :api_version, :value ], unique: true
    end
  end
end
