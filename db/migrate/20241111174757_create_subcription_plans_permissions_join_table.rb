class CreateSubcriptionPlansPermissionsJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_join_table :subscription_plans, :permissions do |t|
      t.index :subscription_plan_id
      t.index :permission_id
    end
  end
end
