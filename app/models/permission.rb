class Permission < ApplicationRecord
  has_and_belongs_to_many :subscription_plans, optional: false
end
