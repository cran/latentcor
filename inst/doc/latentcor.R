## ----setup, include = FALSE---------------------------------------------------
options(tinytex.verbose = TRUE)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(latentcor)

## ----data_generation----------------------------------------------------------
simdata = gen_data(n = 100, types = c("ter", "con"))

## ----data_output--------------------------------------------------------------
names(simdata)

## ----data_matrix--------------------------------------------------------------
X = simdata$X
head(X, n = 6L)

## ----data_plot----------------------------------------------------------------
simdata$plotX

## ----estimation---------------------------------------------------------------
estimate = latentcor(X, types = c("ter", "con"))

## ----estimation_output--------------------------------------------------------
names(estimate)

## ----zratios------------------------------------------------------------------
estimate$zratios

## ----Kendall------------------------------------------------------------------
estimate$K

## ----latent_correlation_pointwise---------------------------------------------
estimate$Rpointwise

## ----latent_correlation-------------------------------------------------------
estimate$R

## ----heatmap------------------------------------------------------------------
estimate$plotR

## ----mtcars-------------------------------------------------------------------
head(mtcars, n = 6L)

## ----unique-------------------------------------------------------------------
apply(mtcars, 2, table)

## ----mtcars_estimation--------------------------------------------------------
estimate_mtcars = latentcor(mtcars, types = c("con", "ter", "con", "con", "con", "con", "con", "bin", "bin", "ter", "con"))

## ----mtcars_types, message = FALSE--------------------------------------------
get_types(mtcars)

## ----mtcars_estimation_output-------------------------------------------------
names(estimate_mtcars)

## ----mtcars_zratios-----------------------------------------------------------
estimate_mtcars$zratios

## ----mtcars_Kendall-----------------------------------------------------------
estimate_mtcars$K

## ----mtcars_latent_correlation_pointwise--------------------------------------
estimate_mtcars$Rpointwise

## ----mtcars_latent_correlation------------------------------------------------
estimate_mtcars$R

## ----mtcars_heatmap-----------------------------------------------------------
estimate_mtcars$plotR

## ----data_generation 2--------------------------------------------------------
simdata2 = gen_data(n = 100, types = c(rep("ter", 3), "con", rep("bin", 3)))

## ----types subsampling--------------------------------------------------------
types = get_types(simdata2$X)
types

## ----subsampling--------------------------------------------------------------
start_time = proc.time()
for (s in 1:10){
  # Select a random subsample of size 80
  subsample = sample(1:100, 80)
  # Estimate latent correlation on subsample specifying the types
  Rs = latentcor(simdata2$X[subsample, ], types = types)
}
proc.time() - start_time

## ----subsampling 2------------------------------------------------------------
start_time = proc.time()
for (s in 1:10){
  # Select a random subsample of size 80
  subsample = sample(1:100, 80)
  # Estimate latent correlation on subsample specifying the types
  Rs = latentcor(simdata2$X[subsample, ], types = NULL)
}
proc.time() - start_time

