#' Constructs the query for the API
#' @description
#' This function constructs the query that is used by the weather_munich_get function.
#' As it is, the parameters are very restrictive for simplicity, but it could be changed to be a
#' wrapper for the Open-Meteo.com API in R. Then again such a package probably already exists and
#' since functionality isn't the focus of this exercise I am content with this. Also as this is an internal
#' function not meant to be used directly, the standards for documentation have clearly been disregarded...
#'
#' @keywords internal


weather_munich_forecast_query <- function(forecast_days = 7, past_days = 0){
  # using httr2 a base url is set
forecast_request <- httr2::request("https://api.open-meteo.com/v1/forecast") |>
  # this url is subsequently modified to include the wanted parameters
  # apart from the _days variables this isn't strictly necessary, but it shows how additional functionality could be added
  httr2::req_url_query(
    latitude = 48.1374,
    longitude = 11.5755,
    daily = c("temperature_2m_max", "temperature_2m_min", "precipitation_sum", "temperature_2m_mean", "sunshine_duration"),
    timezone = "Europe/Berlin",
    past_days = past_days,
    forecast_days = forecast_days,
    # .multi sets the handling of the daily vector, in this case to be separated by a commas
    .multi = "comma"
  )
return(forecast_request)
}
