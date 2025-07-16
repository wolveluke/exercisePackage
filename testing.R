

get_weather_munich_forecast <- function(forecast_days, past_days){
  response <- request("https://api.open-meteo.com/v1/forecast?latitude=48.1374&longitude=11.5755&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,temperature_2m_mean,sunshine_duration&timezone=Europe%2FBerlin&past_days=14&forecast_days=1") %>%
    req_perform()
}

request_test <- request("https://api.open-meteo.com/v1/forecast?latitude=48.1374&longitude=11.5755&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,temperature_2m_mean,sunshine_duration&timezone=Europe%2FBerlin&past_days=14&forecast_days=1") %>%
  req_perform()


get_weather_munich_forecast()

daily <- request_test %>% resp_body_json() %>% pluck('daily')

# Build the dataframe
extracted_data <- tibble(
  time = map_chr(daily$time, 1),
  temp_max_C = map_dbl(daily$temperature_2m_max, 1),
  temp_min_C = map_dbl(daily$temperature_2m_min, 1),
  temp_mean_C = map_dbl(daily$temperature_2m_mean, 1),
  rain_sum = map_dbl(daily$precipitation_sum, 1),
  sunshine_duration = map_dbl(daily$sunshine_duration, 1)
)



