

get_weather_munich_forecast <- function(forecast_days, past_days){
  response <- request("https://api.open-meteo.com/v1/forecast?latitude=48.1374&longitude=11.5755&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,temperature_2m_mean,sunshine_duration&timezone=Europe%2FBerlin&past_days=14&forecast_days=1") %>%
    req_perform()
}

request_test <- request("https://api.open-meteo.com/v1/forecast?latitude=48.1374&longitude=11.5755&daily=temperature_2m_max,temperature_2m_min,precipitation_sum,temperature_2m_mean,sunshine_duration&timezone=Europe%2FBerlin&past_days=90&forecast_days=1") %>%
  req_perform() |>
  resp_body_json()


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

typeof(test_data)

huh <- as.data.frame(test_data)

typeof(huh)
test_data <- weather_munich_get(forecast_days = 16, past_days = 0)

?weather_munich_get(forecast_day)

library(ggplot2)
library(dplyr)
library(tidyr)

weather_plot <- weather_data |>
  tidyr::pivot_longer(cols = c(temp_max_C, temp_min_C, temp_mean_C),
                                 names_to = "temp_type",
                                 values_to = "temp_value") |>
  ggplot2::ggplot(aes(x = as.Date(time),
                      y = temp_value,
                      color = temp_type)) +
  ggplot2::geom_line() +
  ggplot2::geom_point() +
  ggplot2::labs(title = "Recorded and Projected Temperatures on the Requested Days",
       subtitle = "in °C by minimum, mean and maximum",
       x = "Date",
       y = "Temperature in °C") +
  ggplot2::scale_color_discrete(name = "Temperature Type",
                       labels = c("Maximum Temperature",
                                  "Mean Temperature",
                                  "Minimum Temperature"))



