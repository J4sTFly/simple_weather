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
class ApiKey < ApplicationRecord
  belongs_to :subscription_plan, optional: true
  has_many :permissions, through: :subscription_plan

  validates :value, :api_version, presence: true

  scope :active, -> { where(enabled: true) }

  def self.create_default_api_key
    self.create(value: generate_value,
                api_version: ENV.fetch("LATEST_API_VERSION", 1),
                subscription_plan: SubscriptionPlan.find(SubscriptionPlan::DEFAULT_SUBSCRIPTION_ID))
  end

  def self.generate_value
    SecureRandom.uuid.gsub("-", "")
  end
end
