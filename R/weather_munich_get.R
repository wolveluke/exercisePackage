#' Get Munich weather forecast data as tibble
#' @description
#' Queries the Open-Meteo.com API for Munich and returns daily weather data for selected number of days in the past and in the future as a tibble.
#' <a href="https://open-meteo.com/">Weather data by Open-Meteo.com</a>
#'
#' @param forecast_days A number between 0 and 16
#' @param past_days A number between 0 and 82
#'
#' @returns A tibble
#' @export
#'
#' @examples
#' weather_munich_get(forecast_days = 7, past_days = 0)


# the limitation of 82 days is because null values are returned for me if I go over that.
# There is probably a way of handling that exception to return NA in the tibble
# instead of the whole function breaking, but once again, since functionality isn't the focus of this exercise
# I don't think that would be a good use of my time

# allows user to enter which days data should be returned for
weather_munich_get <- function(forecast_days = 7, past_days = 0){
  # defines response object using the query function and req_perform
  weather_response <- weather_munich_forecast_query(forecast_days, past_days) |>
    httr2::req_perform()

  # daily data is taken from json response
  # (hourly data is available through the API, but isn't requested for simplicity)
  daily <- weather_response |>
    httr2::resp_body_json() |>
    purrr::pluck('daily')

  # daily list is parsed and mapped onto tibble using map_ functions
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
