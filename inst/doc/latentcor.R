## ----setup, include = FALSE---------------------------------------------------
options(tinytex.verbose = TRUE)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(latentcor)

## ----data_generation----------------------------------------------------------
simdata = GenData(n = 100, types = c("ter", "con"))

## ----data_output--------------------------------------------------------------
names(simdata)

## ----data_matrix--------------------------------------------------------------
X = simdata$X
head(X, n = 6L)

## ----data_plot----------------------------------------------------------------
simdata$plotX

## ----estimation---------------------------------------------------------------
estimate = estR(X, types = c("ter", "con"))

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
estimate_mtcars = estR(mtcars, types = c("con", "ter", "con", "con", "con", "con", "con", "bin", "bin", "ter", "con"))

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

## ----continuous---------------------------------------------------------------
X = GenData(n = 6, types = "con")$X
X

## ----binary-------------------------------------------------------------------
X = GenData(n = 6, types = "bin")$X
X

## ----ternary------------------------------------------------------------------
X = GenData(n = 6, types = "ter")$X
X

## ----truncated----------------------------------------------------------------
X = GenData(n = 6, types = "tru")$X
X

## ----mixed--------------------------------------------------------------------
set.seed("234820")
X = GenData(n = 100, types = c("con", "bin", "ter", "tru"))$X
head(X)

## ----KendallTau---------------------------------------------------------------
estimate = estR(X, types = c("con", "bin", "ter", "tru"))
K = estimate$K
K

## ----callR, warning = FALSE, message = F--------------------------------------
estimate = estR(X, types = c("con", "bin", "ter", "tru"), method = "original")

## ----kendall------------------------------------------------------------------
estimate$K

## ----zratios_2----------------------------------------------------------------
estimate$zratios

## ----estimate2----------------------------------------------------------------
estimate$R

## ----callR2, warning = FALSE, message = F-------------------------------------
estimate = estR(X, types = c("con", "bin", "ter", "tru"), method = "approx")

## ----estimate3, warning = FALSE, message = F----------------------------------
estR(X, types = c("con", "bin", "ter", "tru"), method = "approx", ratio = 0.99)$R
estR(X, types = c("con", "bin", "ter", "tru"), method = "approx", ratio = 0.4)$R
estR(X, types = c("con", "bin", "ter", "tru"), method = "original")$R

## ---- message = FALSE---------------------------------------------------------
set.seed("234820")
X = GenData(n = 6, types = c("con", "bin", "ter", "tru"))$X
X
out = estR(X, types = c("con", "bin", "ter", "tru"))
out$Rpointwise
eigen(out$Rpointwise)$values

## ---- message = TRUE----------------------------------------------------------
out = estR(X, types = c("con", "bin", "ter", "tru"))

## -----------------------------------------------------------------------------
out = estR(X, types = c("con", "bin", "ter", "tru"), nu = 0.001)
out$Rpointwise
out$R

## -----------------------------------------------------------------------------
set.seed("234820")
X = GenData(n = 100, types = c("con", "bin", "ter", "tru"))$X
out = estR(X, types = c("con", "bin", "ter", "tru"), nu = 0.001)
out$Rpointwise
out$R

