#' Temperature Weather Plot
#'
#' @description
#' Function that returns a ggplot2 plot visualizing the daily minimum, maximum and
#' mean temperatures for the requested days. Can be modified further using "+" in the usual
#' ggplot2 fashion, if needed.
#'
#' @param forecast_days A number between 0 and 16
#' @param past_days A number between 0 and 82
#'
#' @returns A ggplot2 plot object
#' @export
#'
#' @examples weather_munich_plot_3m(forecast_days = 14, past_days = 0)
weather_munich_plot_3m <- function(forecast_days = 14, past_days = 0){

  weather_data <- weather_munich_get(forecast_days, past_days)

  weather_3m_plot <- weather_data |>
    tidyr::pivot_longer(cols = c(temp_max_C, temp_min_C, temp_mean_C),
                        names_to = "temp_type",
                        values_to = "temp_value") |>
    ggplot2::ggplot(ggplot2::aes(x = as.Date(time),
                                  y = temp_value,
                                  color = temp_type)) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::labs(title = "Recorded and Projected Temperatures on the Requested Days",
                  subtitle = "in Degrees C by minimum, mean and maximum",
                  x = "Date",
                  y = "Temperature in Degrees C") +
    ggplot2::scale_color_discrete(name = "Temperature Type",
                                  labels = c("Maximum Temperature",
                                             "Mean Temperature",
                                             "Minimum Temperature"))
return(weather_3m_plot)
}
