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
class SubscriptionPlan < ApplicationRecord
  DEFAULT_SUBSCRIPTION_ID = 1

  has_and_belongs_to_many :permissions

  validates :name, presence: true
end
