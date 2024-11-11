class SubscriptionPlan < ApplicationRecord
  DEFAULT_SUBSCRIPTION_ID = 1

  has_and_belongs_to_many :permissions

  validates :name, presence: true
end
