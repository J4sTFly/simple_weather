class MailWeatherDataWorker
  include Sidekiq::Worker

  def perform(params)
    params = JSON.parse(params).symbolize_keys
    result = Api::V1::RetrieveWeatherDataService.new.call(params[:service_query].symbolize_keys)
    if result
      data = Api::V1::WeatherDataSerializer.new(result).serialized_data
      WeatherDataMailer.with(email: params[:email], data:).weather_data_email.deliver_now
    end
  end
end
