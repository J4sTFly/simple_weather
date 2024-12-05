source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.2"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false
  gem "letter_opener", "~> 1.10"
  gem "pry"
  gem "annotate", "~> 3.2"

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :test do
  gem "rspec-sidekiq", "~> 5.0"
  gem "rspec", "~> 3.13"
  gem "rspec-rails", "~> 7.1"
  gem "simplecov", "~> 0.22.0"
  gem "factory_bot_rails", "~> 6.4"
end

gem "pg", "~> 1.5"

gem "data_migrate", "~> 11.1"

gem "faraday", "~> 2.12"

gem "sidekiq", "~> 7.3"

# Scheduling gem
gem "ice_cube", "~> 0.17.0"

# OpenTelemetry tracing
gem "opentelemetry-sdk", "~> 1.5"
gem "opentelemetry-instrumentation-all", "~> 0.68.0"
# gem "opentelemetry-exporter-otlp", "~> 0.29.0"
gem "opentelemetry-exporter-jaeger", "~> 0.23.0"
gem "opentelemetry-instrumentation-pg", "~> 0.29.0"
gem "opentelemetry-metrics-api", "~> 0.1.1"
gem "opentelemetry-metrics-sdk", "~> 0.4.1"

gem "dotenv-rails", "~> 3.1"
gem "rswag", "~> 2.16"
