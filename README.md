<div  align="center">
  <h1>SimpleWeather</h1>
</div

<div  align="center">
  🐘 Postgres · 💎 Ruby 3.3.5 · 🛤 Rails 7.2 ·
</div>

SimpleWeather is a simple Rails project written with growth intentions in mind. It currently contains logic for retrieving weather forecasts from [WeatherAPI](https://weatherapi.com) and scheduled weather forecasts mail delivery. The project also includes OpenTelemetry tracing functionality and is able to interact with Jaeger.

# Setting Things Up

1. Ensure that you have installed Redis.
2. Sign up at WeatherAPI and generate your personal token.

### Clone the Git Repository
```sh
git  clone  https://github.com/J4sTFly/simple_weather.git

cd  ./simple_weather
```
### Install Dependencies
```sh
bundle  install
```

Then run:
```sh
export  EDITOR=nano | rails  credentials:edit
```
Copy the contents from `credentials-sample` into the credentials editor.

### Run the Application
```sh
rails  db:create
rails  db:migrate

rails  s

bundle  exec  sidekiq  -e  development
```

### Launch Jaeger
```sh
docker  run  --rm  --name  jaeger  \
-e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
-p  16686:16686  \
-p 4317:4317 \
-p  4318:4318  \
-p 14250:14250 \
-p  14268:14268  \
-p 14269:14269 \
-p  9411:9411  \
jaegertracing/all-in-one:1.63.0
```

Jaeger UI will run on port `:16686`

Hit the `api/v1/api_keys` endpoint to generate new ApiKey and

`You are ready to go!`

# Proposals
Here are my proposals on how to improve application and broaden its auditory: [LINK](https://drive.google.com/file/d/1Gb-ndshU7_DM7HYRUjHW37wdQeF8Wzw7/view?usp=sharing)
