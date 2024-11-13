module Api
  module V1
    class ScheduleWeatherMailingService
      attr_reader :time, :weekdays, :params

      def initialize(params)
        @time = params[:time].to_time
        @weekdays = params[:weekdays].split(",")
        @params = params
      end

      def call
        schedule = IceCube::Schedule.new(Time.now)
        rule = IceCube::Rule.weekly.day(*day_indexes).hour_of_day(time.hour).minute_of_hour(time.min)
        schedule.add_recurrence_rule(rule)
        schedule.occurrences(Time.now + 1.year).each do |occurence|
          MailWeatherDataWorker.perform_at(occurence, params.to_json)
        end

        rule.to_s
      end

      private

      def day_indexes
        weekdays.map { |wd| IceCube::IcalBuilder::ICAL_DAYS.index wd }
      end
    end
  end
end
