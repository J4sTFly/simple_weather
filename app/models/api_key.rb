class ApiKey < ApplicationRecord
  belongs_to :subscription_plan, optional: true
  has_many :permissions, through: :subscription_plan

  validates :value, :api_version, presence: true

  scope :active, -> { where(enabled: true) }
end
