% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kssa.R
\name{kssa}
\alias{kssa}
\title{kssa Algorithm}
\usage{
kssa(
  x_ts,
  start_methods,
  actual_methods,
  segments,
  iterations,
  percentmd = sample(x = 1:50, size = 1)/100,
  seed = 1234
)
}
\arguments{
\item{x_ts}{Time series object \code{\link{ts}} containing missing data (NA)}

\item{start_methods}{String vector. The method or methods to start the algorithm.
Same as for actual_methods}

\item{actual_methods}{The imputation methods to compare. It can be a string vector containing the following
11 imputation methods:

\itemize{
\item{"all" - compare among all methods automatically - Default}
\item{"auto.arima" - State space representation of an ARIMA model}
\item{"StructTS" - State space representation of a structural model}
\item{"seadec" - Seasonal decomposition with Kalman smoothing}
\item{"linear_i" - simple linear interpolation}
\item{"spline_i" - spline interpolation}
\item{"stine_i" - Stineman interpolation}
\item{"simple_ma" - Stineman interpolation}
\item{"stine_i" - Stineman interpolation}
\item{"simple_ma" - Simple moving average}
\item{"linear_ma" - Linear moving average}
\item{"exponential_ma" - Exponential moving average}
\item{"locf" - Last observation carried forward}
\item{"stl" - Seasonal and trend decomposition with Loess}
}

For further details on these imputation methods please check packages \code{\link{imputeTS}} and \code{\link{forecast}}}

\item{segments}{Integer. Into how many segments the time series will be divided}

\item{iterations}{Integer. How many iterations to run}

\item{percentmd}{Percentage of missing data. Must match with the true percentage of missing data in x_ts}

\item{seed}{Numeric. Random seed to choose}
}
\value{
A list of results to be plotted with function \code{\link{kssa_plot}} for easy interpretation
}
\description{
Run the Known Sub-Sequence Algorithm to compare imputation methods for time series data
}
\examples{
# create a numeric vector with 20\% missing data
x = c(1, 5, 6, 8, 4, NA, 5, 4, NA, NA)

# convert x to a time series object
x_ts = ts(x)

# apply the kssa algorithm with 2 segments,
# 10 iterations and 20\% of missing data.
# Remember that percentmd must match with
# the real percentaje of missing data in the
# input time series

results_kssa = kssa(x_ts,
               start_methods = "all",
               actual_methods = "all",
               segments = 2,
               iterations = 10,
               percentmd = 0.2)

# print results
results_kssa

# plot complete results with Root Mean Squared Error for easy
# interpretation
kssa_plot(results_kssa, type = "complete", metric = "rmse")

# Conclusion: Since the kssa_plot is ordered from lower to
# higher (left to right) average error, the method
# exponential_ma (exponential moving average) is
# the best to impute missing data in x_tx.

}
\references{
Benavides, I. F., Santacruz, M., Romero-Leiton, J. P., Barreto, C., & Selvaraj, J. J. (2022). Assessing methods for multiple imputation of systematic missing data in marine fisheries time series with a new validation algorithm. Aquaculture and Fisheries.
\href{https://www.sciencedirect.com/science/article/pii/S2468550X21001696}{Full text publication}.
}
