## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
    collapse = TRUE,
    comment = "#>"
)
# Load Library
library(mlmpower)

# Set seed
set.seed(981723)

# Load Cache
powersim1 <- readRDS('powersim1.rds')
powersim2 <- readRDS('powersim2.rds')
powersim3 <- readRDS('powersim3.rds')

## -----------------------------------------------------------------------------
example1 <- (
    effect_size(
        icc          = c(.10, .25),
        within       = .065,
        between      = .065,
        product      = .01,
        random_slope = .03
    )
    + outcome('y', mean = 50, sd = 10)
    + within_predictor('x1', icc = 0, weight = .80)
    + within_predictor('x2', weight = .20)
    + between_predictor('z1', weight = .80)
    + between_predictor('z2', weight = .20)
    + product('x1','z1', weight = 1)
    + random_slope('x1', weight = 1)
)

## -----------------------------------------------------------------------------
example1 <- (
    effect_size(
        icc          = c(.10, .25),
        within       = .065,
        between      = .065,
        product      = .01,
        random_slope = .03
    )
    + outcome('y', mean = 50, sd = 10)
    + within_predictor('x1', icc = 0, weight = .80)
    + within_predictor('x2', weight = .20)
    + between_predictor('z1', weight = .80)
    + between_predictor('z2', weight = .20)
    + product('x1','z1', weight = 1)
    + random_slope('x1', weight = 1)
    + correlations(
        within  = random(0.1, 0.3),
        between = random(0.1, 0.3),
        randeff = random(0.1, 0.3)
    )
)

## -----------------------------------------------------------------------------
summary(example1)

## ----eval = FALSE-------------------------------------------------------------
# # Set seed for replicable results
# set.seed(2318971)
# 
# # Run Power Analysis
# powersim1 <-
#     power_analysis(
#         model = example1,
#         replications = 2000,
#         n_between = c(30, 60, 90, 120),
#         n_within = c(10, 20, 30)
#     )

## -----------------------------------------------------------------------------
summary(powersim1)

## -----------------------------------------------------------------------------
example2 <- (
    effect_size(
        icc          = c(.40, .60),
        within       = .13,
        between      = .065,
        product      = .03,
        random_slope = .10
    )
    + outcome('y', mean = 50, sd = 10)
    + within_time_predictor('x1', weight = .50, values = 0:4)
    + within_predictor('x2', weight = .25)
    + within_predictor('x3', weight = .25)
    + between_binary_predictor('z1', proportion = .50, weight = 0)
    + between_predictor('z2', weight = .50)
    + between_predictor('z3', weight = .50)
    + product('x1','z1', weight = 1)
    + random_slope('x1', weight = 1)
    + correlations(
        within  = random(.20, .40),
        between = random(.10, .30),
        randeff = random(.30, .50)
    )
)

## -----------------------------------------------------------------------------
summary(example2)

## ----eval = FALSE-------------------------------------------------------------
# # Set seed for replicable results
# set.seed(12379)
# 
# # Run Power Analysis
# powersim2 <-
#     power_analysis(
#         model = example2,
#         replications = 2000,
#         n_between = c(50, 60, 70, 80, 90, 100),
#         n_within = 5
#     )

## -----------------------------------------------------------------------------
summary(powersim2)

## -----------------------------------------------------------------------------
example3 <- (
    effect_size(
        icc     = c(.10, .25),
        within  = .18,
        between = .038,
    )
    + outcome('y')
    + within_predictor('x1', weight = .70)
    + within_predictor('x2', weight = .10)
    + within_predictor('x3', weight = .10)
    + within_predictor('x4', weight = .10)
    + between_binary_predictor('z1', proportion = .50, weight = 1)
)


## -----------------------------------------------------------------------------
example3 <- (
    example3
    + correlations(
        within  = random(0.1, 0.3),
        between = random(0.1, 0.3)
    )
)

## -----------------------------------------------------------------------------
summary(example3)

## ----eval = FALSE-------------------------------------------------------------
# # Set seed for replicable results
# set.seed(981723)
# 
# # Run Power Analysis
# powersim3 <-
#     power_analysis(
#         model = example3,
#         replications = 2000,
#         n_between = c(30, 60, 90, 120),
#         n_within = c(15, 30)
#     )

## -----------------------------------------------------------------------------
summary(powersim3)

