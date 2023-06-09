% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/actions.R
\name{random_slope}
\alias{random_slope}
\title{Create a Random Slope in a Model}
\usage{
random_slope(name, weight = 1)
}
\arguments{
\item{name}{a character string that references a variable's name}

\item{weight}{a single numeric value specifying the variable's contribution to the variance explained metric.
Weights are normalized across all variables of the same level.}
}
\value{
A \code{\link{mp_action}} that can be added to a \code{\link{mp_model}}.
}
\description{
Creates a random slope that can be added to a \code{\link{mp_model}}.
}
\examples{
# Create Model
model <- (
    outcome('Y')
    + within_predictor('X')
    + effect_size(
        icc = 0.1,
        within = 0.1,
        random_slope = 0.03
    )
)
# Add random slope to the model
model + random_slope('X')
}
