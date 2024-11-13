require 'rails_helper'

RSpec.describe "Api::V1::ApiKeysControllers", type: :request do
  let!(:subscription_plan) { create :subscription_plan }
  let!(:api_key) { create :api_key }

  describe "GET /index" do
    let(:valid_query) do
      {
        key: api_key.value,
        city: 'London',
        days: 1
      }
    end

    it 'returns weather forecast with valid query_params' do
      get api_v1_weather_index_path, params: valid_query

      expect(response).to be_successful
      expect(JSON.parse(response.body).length).to eq(valid_query[:days])
      expect(JSON.parse(response.body).first['date'].to_date).to eq(Date.today)
    end


    let(:exceed_max_days) do
      {
        key: api_key.value,
        city: 'London',
        days: subscription_plan.forecast_days + 1
      }
    end
    it '400 when forecast days number is greater than subscription plan allows' do
      get api_v1_weather_index_path, params: exceed_max_days

      expect(response).to be_a_bad_request
      expect(response.body).to eq({ errors: [ "Days #{I18n.t('activemodel.errors.models.api/v1/weather_base_form.attributes.days.not_in_plan_forecast_range')}" ] }.to_json)
    end


    let(:too_many_params) do
      {
        key: api_key.value,
        city: 'London',
        lat: 12.32
      }
    end
    it '400 when too many params provided' do
      get api_v1_weather_index_path, params: too_many_params

      expect(response).to be_a_bad_request
      expect(response.body).to eq({ errors: [ I18n.t('activemodel.errors.models.api/v1/weather_base_form.attributes.base.incorrect_params_provided') ] }.to_json)
    end
  end

  describe "POST /schedule" do
    let(:valid_params) do
      {
        key: api_key.value,
        city: "London",
        days: 1,
        time: "11:00",
        weekdays: "MO",
        email: "sample@mail.com"
      }
    end

    it 'returns schedule and schedules a new sidekiq workers if params are valid' do
      post schedule_api_v1_weather_index_path, params: valid_params

      time = valid_params[:time].to_time
      ice_cube_rule = IceCube::Rule.weekly.day(1).hour_of_day(time.hour).minute_of_hour(time.min)

      expect(response).to be_successful
      expect(response.body).to eq({ message: I18n.t('api.v1.weather.schedule.scheduled', schedule: ice_cube_rule.to_s) }.to_json)
      expect(Sidekiq::ScheduledSet.new.size).not_to be_zero
    end


    let(:invalid_params) do
      {
        key: api_key.value,
        city: "London",
        days: 1,
        time: "25:60",
        weekdays: "MO, TUESDAY",
        email: "invalid mail"
      }
    end

    it '400 when params are invalid' do
      post schedule_api_v1_weather_index_path, params: invalid_params

      expect(response).to be_a_bad_request
      expect(response.body).to eq({
        errors: [ 'Email is invalid',
                  "Time #{I18n.t('activemodel.errors.models.api/v1/schedule_weather_form.attributes.time.invalid_format')}",
                  "Weekdays #{I18n.t('activemodel.errors.models.api/v1/schedule_weather_form.attributes.weekdays.invalid_format')}" ]
      }.to_json)
    end
  end
end
