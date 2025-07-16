#' Sunshine Duration Weather Plot
#'
#' @description
#' Function that returns a ggplot2 plot visualizing the daily sunshine duration for the requested days.
#' Can be modified further using "+" in the usual ggplot2 fashion, if needed.
#'
#' @param forecast_days A number between 0 and 16
#' @param past_days A number between 0 and 82
#'
#' @returns A ggplot2 plot object
#' @export
#'
#' @examples weather_munich_plot_sunshine(forecast_days = 14, past_days = 0)
weather_munich_plot_sunshine <- function(forecast_days = 14, past_days = 0){

  weather_data <- weather_munich_get(forecast_days, past_days)

  weather_sunshine_plot <- ggplot2::ggplot(weather_data,
                                           ggplot2::aes(x = as.Date(time),
                                                          y = sunshine_duration/3600)) +
    ggplot2::geom_col(fill = "goldenrod") +
    ggplot2::labs(
      title = "Daily Sunshine Duration in Munich",
      x = "Date",
      y = "Sunshine Duration (hours)"
    ) +
    ggplot2::theme_minimal()

  return(weather_sunshine_plot)
}
