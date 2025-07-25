% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/weather_munich_plot_rain.R
\name{weather_munich_plot_rain}
\alias{weather_munich_plot_rain}
\title{Rain Sum Weather Plot}
\usage{
weather_munich_plot_rain(forecast_days = 14, past_days = 0)
}
\arguments{
\item{forecast_days}{A number between 0 and 16}

\item{past_days}{A number between 0 and 82}
}
\value{
A ggplot2 plot object
}
\description{
Function that returns a ggplot2 plot visualizing the daily precipitation sum for the requested days.
Can be modified further using "+" in the usual ggplot2 fashion, if needed.
\if{html}{\out{<a href="https://open-meteo.com/">}}Weather data by Open-Meteo.com\if{html}{\out{</a>}}
}
\examples{
weather_munich_plot_rain(forecast_days = 14, past_days = 0)
}
