class CreateSubscriptionPlans < ActiveRecord::Migration[7.2]
  def change
    create_table :subscription_plans do |t|
      t.string :name, null: false
      t.integer :forecast_days, null: false
      t.timestamps
    end
  end
end
