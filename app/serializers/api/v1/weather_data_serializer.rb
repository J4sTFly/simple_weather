module Api
  module V1
    class WeatherDataSerializer
      DAY_KEYS = %w[avgtemp_c maxwind_kph totalprecip_mm totalsnow_cm daily_chance_of_rain daily_chance_of_snow]
      attr_reader :data

      def initialize(data)
        @data = data
      end

      def serialized_data
        @serialized_data ||= serialize_data
      end

      private

      def serialize_data
        data.dig("forecast", "forecastday").map do |day|
          { date: day["date"] }.merge(day["day"].slice(*DAY_KEYS))
        end
      end
    end
  end
end
