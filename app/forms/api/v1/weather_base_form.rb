module Api
  module V1
    class WeatherBaseForm < BaseForm
      LOCATION_PARAMS = %i[city lat lon ip]
      LOCATION_PARAMS_VARIANTS = [
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

      validates :lat, numericality: { in: -90..90 }, if: -> { lat.present? }
      validates :lon, numericality: { in: -180..180 }, if: -> { lon.present? }
      validate :days_in_plan_forecast_range, :correct_location_params_provided

      def initialize(subscription_plan, **params)
        @subscription_plan = subscription_plan
        super **params
      end

      private

      def build_params
        if city.present?
          { q: city, days: }
        elsif ip.present?
          { q: ip, days: }
        else
          { lat:, lon:, days: }
        end
      end

      def days_in_plan_forecast_range
        errors.add(:days, :not_in_plan_forecast_range) unless (1..subscription_plan.forecast_days).include?(days)
      end

      def correct_location_params_provided
        errors.add(:base, :incorrect_params_provided) unless LOCATION_PARAMS_VARIANTS.include? attributes.slice(*LOCATION_PARAMS).compact.keys
      end
    end
  end
end
