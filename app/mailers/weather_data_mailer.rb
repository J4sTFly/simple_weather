class WeatherDataMailer < ApplicationMailer
  def weather_data_email
    @data = param[:data]
    mail(to: params[:email], subject: I18n.t("mailers.weather_data.subj"))
  end
end
