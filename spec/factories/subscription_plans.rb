FactoryBot.define do
  factory :subscription_plan do
    id { 1 }
    name { 'Default' }
    forecast_days { 14 }
  end
end
