# == Schema Information
#
# Table name: api_keys
#
#  api_version          :integer          not null, primary key
#  enabled              :boolean          default(TRUE)
#  value                :string           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  subscription_plan_id :bigint
#
# Indexes
#
#  index_api_keys_on_api_version_and_value  (api_version,value) UNIQUE
#  index_api_keys_on_subscription_plan_id   (subscription_plan_id)
#
FactoryBot.define do
  factory :api_key do
    api_version { 1 }
    enabled { true }
    value { SecureRandom.uuid.gsub("-", "") }
    subscription_plan_id { 1 }
  end
end
