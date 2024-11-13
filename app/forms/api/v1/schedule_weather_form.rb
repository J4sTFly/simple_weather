module Api
  module V1
    class ScheduleWeatherForm < WeatherBaseForm
      WEEKDAYS = IceCube::IcalBuilder::ICAL_DAYS.to_set
      attribute :weekdays, :string
      attribute :time, :string
      attribute :email, :string

      validates :weekdays, :time, presence: true
      validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
      validate :time_is_valid
      validate :weekdays_are_valid

      def run
        return false if invalid?

        @result = ScheduleWeatherMailingService.new(build_params).call
      end

      private

      def build_params
        { service_query: super }.merge(attributes.compact)
      end

      def time_is_valid
        time&.to_time
      rescue ArgumentError
        errors.add(:time, :invalid_format)
      end

      def weekdays_are_valid
        errors.add(:weekdays, :invalid_format) unless  weekdays&.split(",").to_a.to_set.subset?(WEEKDAYS)
      end
    end
  end
end
