class AddForecastDaysToSubscriptionPlans < ActiveRecord::Migration[7.2]
  def change
    add_column :subscription_plans, :forecast_days, :integer, null: false
  end
end
