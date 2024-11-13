module Api
  module V1
    class RetrieveWeatherForm < WeatherBaseForm
      def run
        return false if invalid?

        @result = RetrieveWeatherDataService.new.call(build_params)
        errors.add(:base, :service_unavailable) unless @result
        @result
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
    end
  end
end
