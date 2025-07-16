weather_munich_get <- function(forecast_days = 7, past_days = 0){
  weather_response <- weather_munich_forecast_query(forecast_days, past_days) |>
    req_perform()

  daily <- weather_response |>
    resp_body_json() |>
    pluck('daily')

  extracted_data <- tibble::tibble(
    time = purrr::map_chr(daily$time, 1),
    temp_max_C = purrr::map_dbl(daily$temperature_2m_max, 1),
    temp_min_C = purrr::map_dbl(daily$temperature_2m_min, 1),
    temp_mean_C = purrr::map_dbl(daily$temperature_2m_mean, 1),
    rain_sum = purrr::map_dbl(daily$precipitation_sum, 1),
    sunshine_duration = purrr::map_dbl(daily$sunshine_duration, 1)
  )
return(extracted_data)
}
