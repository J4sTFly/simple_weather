module Api
  module V1
    class RetrieveWeatherDataService
      include Rails.application.routes.url_helpers
      # ENV for testing purposes only. In real app should be taken from credentials
      # Rails.application.credentials.dig(:secrets, :weatherapi_token)
      WEATHERAPI_TOKEN = ENV.fetch("WEATHERAPI_TOKEN")

      def call(query)
        response = Faraday.get(weather_api_url, query.merge(key: WEATHERAPI_TOKEN))
        JSON.parse(response.body)
      rescue Faraday::ConnectionFailed => e
        Rails.logger.error(e)
        false
      end
    end
  end
end
