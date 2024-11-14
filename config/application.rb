require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module SimpleWeather
  class Application < Rails::Application
    # Used to access /sidekiq route from browser
    config.middleware.use ActionDispatch::Cookies if Rails.env.development?
    config.middleware.use ActionDispatch::Session::CookieStore if Rails.env.development?
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])
    config.active_job.queue_adapter = :sidekiq

    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
