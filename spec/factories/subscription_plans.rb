# == Schema Information
#
# Table name: subscription_plans
#
#  id            :bigint           not null, primary key
#  forecast_days :integer          not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :subscription_plan do
    id { 1 }
    name { 'Default' }
    forecast_days { 14 }

    after(:create) do |subscription_plan|
      subscription_plan.permissions << create(:weather_index_permission)
      subscription_plan.permissions << create(:weather_schedule_permission)
    end
  end
end
