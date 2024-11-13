# == Schema Information
#
# Table name: permissions
#
#  id          :bigint           not null, primary key
#  action      :string           not null
#  api_version :integer          not null
#  controller  :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Permission < ApplicationRecord
  has_and_belongs_to_many :subscription_plans, optional: false
end
