#' Rain Sum Weather Plot
#'
#' @description
#' Function that returns a ggplot2 plot visualizing the daily precipitation sum for the requested days.
#' Can be modified further using "+" in the usual ggplot2 fashion, if needed.
#' <a href="https://open-meteo.com/">Weather data by Open-Meteo.com</a>
#'
#' @param forecast_days A number between 0 and 16
#' @param past_days A number between 0 and 82
#'
#' @returns A ggplot2 plot object
#' @export
#'
#' @examples weather_munich_plot_rain(forecast_days = 14, past_days = 0)
weather_munich_plot_rain <- function(forecast_days = 14, past_days = 0){

  weather_data <- weather_munich_get(forecast_days, past_days)

  weather_rain_plot <- ggplot2::ggplot(weather_data,
                                       ggplot2::aes(x = as.Date(time),
                                          y = rain_sum)) +
    ggplot2::geom_col(fill = "skyblue") +
    ggplot2::labs(
      title = "Daily Rainfall in Munich",
      x = "Date",
      y = "Rainfall (mm)",
      caption = "Weather data by Open-Meteo.com"
    ) +
    ggplot2::theme_minimal()

  return(weather_rain_plot)
}
