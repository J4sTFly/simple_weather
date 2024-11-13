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
# Indexes
#
#  index_permissions_on_controller_and_action  (controller,action) UNIQUE
#
FactoryBot.define do
  factory :permission do
    factory :weather_index_permission do
      controller { 'api/v1/weather' }
      api_version { 1 }
      action { 'index' }
    end

    factory :weather_schedule_permission do
      controller { 'api/v1/weather' }
      api_version { 1 }
      action { 'schedule' }
    end
  end
end
