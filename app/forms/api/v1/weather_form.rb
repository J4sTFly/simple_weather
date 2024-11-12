module Api
  module V1
    class WeatherForm < BaseForm
      PARAMS_VARIANTS = [
        [ :city ],
        [ :lat, :lon ],
        [ :ip ]
      ]

      attr_reader :subscription_plan, :result

      attribute :city, :string
      attribute :lat, :float
      attribute :lon, :float
      attribute :ip, :string
      attribute :days, :integer, default: 1

      validate :days_in_plan_forecast_range, :correct_params_provided

      def initialize(subscription_plan, **params)
        @subscription_plan = subscription_plan
        super **params
      end

      def run
        return false if invalid?
        @result = RetrieveWeatherDataService.new.call(build_params)
      end

      private

      def build_params
        if city.present?
          { q: city, days: }
        elsif ip.present?
          { q: ip, days: }
        else
          attributes.compact
        end
      end

      def days_in_plan_forecast_range
        errors.add(:days, :not_in_plan_forecast_range) unless (1..subscription_plan.forecast_days).include?(days)
      end

      def correct_params_provided
        errors.add(:base, :incorrect_params_provided) unless PARAMS_VARIANTS.include? attributes.compact.except(:days).keys
      end
    end
  end
end
