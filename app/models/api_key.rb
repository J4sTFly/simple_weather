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

  private

  def generate_value
    SecureRandom.uuid.gsub("-", "")
  end
end
