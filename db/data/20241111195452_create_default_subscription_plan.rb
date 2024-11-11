# frozen_string_literal: true

class CreateDefaultSubscriptionPlan < ActiveRecord::Migration[7.2]
  def up
    SubscriptionPlan.create(name: 'Default')
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
