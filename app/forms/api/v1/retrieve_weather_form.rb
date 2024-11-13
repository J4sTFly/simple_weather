module Api
  module V1
    class RetrieveWeatherForm < WeatherBaseForm
      def run
        return false if invalid?

        @result = RetrieveWeatherDataService.new.call(build_params)
        errors.add(:base, :service_unavailable) unless @result
        @result
      end
    end
  end
end
