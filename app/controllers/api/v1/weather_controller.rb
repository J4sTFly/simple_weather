class Api::V1::WeatherController < Api::ApiController
  def index
    weather_form = Api::V1::RetrieveWeatherForm.new(api_key.subscription_plan, **weather_params)

    if weather_form.run
      render json: Api::V1::WeatherDataSerializer.new(weather_form.result).serialized_data
    else
      render json: { errors: weather_form.errors.full_messages }, status: :bad_request
    end
  end

  def schedule; end
  end

  private

  def weather_params
    params.permit :ip, :city, :lat, :lon, :days
  end
end
