module Api
  module V1
    class RetrieveWeatherDataService
      include Rails.application.routes.url_helpers
      WEATHERAPI_TOKEN = Rails.application.credentials.dig(:secrets, :weatherapi_token)

      def call(query)
        response = Faraday.get(weather_api_url, query.merge(key: WEATHERAPI_TOKEN))
        JSON.parse(response.body)
      end
    end
  end
end
