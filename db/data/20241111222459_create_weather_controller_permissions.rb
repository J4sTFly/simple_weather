# frozen_string_literal: true

class CreateWeatherControllerPermissions < ActiveRecord::Migration[7.2]
  def up
    default_subscription_plan = SubscriptionPlan.find(SubscriptionPlan::DEFAULT_SUBSCRIPTION_ID)

    %w[index schedule].each do |action|
      Permission.create!(api_version: 1,
                         controller: 'api/v1/weather',
                         action:,
                         subscription_plans: [ default_subscription_plan ])
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
