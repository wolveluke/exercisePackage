weather_munich_forecast_query <- function(forecast_days = 14, past_days = 0){
forecast_request <- request("https://api.open-meteo.com/v1/forecast") %>%
  req_url_query(
    latitude = 48.1374,
    longitude = 11.5755,
    daily = c("temperature_2m_max", "temperature_2m_min", "precipitation_sum", "temperature_2m_mean", "sunshine_duration"),
    timezone = "Europe/Berlin",
    past_days = past_days,
    forecast_days = forecast_days,
    .multi = "comma"
  )
return(forecast_request)
}

