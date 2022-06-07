## ----setup, include = FALSE---------------------------------------------------
options(tinytex.verbose = TRUE)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(latentcor)

## ----continuous---------------------------------------------------------------
X = gen_data(n = 6, types = "con")$X
X

## ----binary-------------------------------------------------------------------
X = gen_data(n = 6, types = "bin")$X
X

## ----ternary------------------------------------------------------------------
X = gen_data(n = 6, types = "ter")$X
X

## ----truncated----------------------------------------------------------------
X = gen_data(n = 6, types = "tru")$X
X

## ----mixed--------------------------------------------------------------------
set.seed("234820")
X = gen_data(n = 100, types = c("con", "bin", "ter", "tru"))$X
head(X)

## ----KendallTau---------------------------------------------------------------
estimate = latentcor(X, types = c("con", "bin", "ter", "tru"))
K = estimate$K
K

## ----callR, warning = FALSE, message = F--------------------------------------
estimate = latentcor(X, types = c("con", "bin", "ter", "tru"), method = "original", tol = 1e-8)

## ----kendall------------------------------------------------------------------
estimate$K

## ----zratios_2----------------------------------------------------------------
estimate$zratios

## ----estimate2----------------------------------------------------------------
estimate$Rpointwise

## ----callR2, warning = FALSE, message = F-------------------------------------
#estimate = latentcor(X, types = c("con", "bin", "ter", "tru"), method = "approx")

## ----estimate3, warning = FALSE, message = F----------------------------------
#latentcor(X, types = c("con", "bin", "ter", "tru"), method = "approx", ratio = 0.99)$R
#latentcor(X, types = c("con", "bin", "ter", "tru"), method = "approx", ratio = 0.4)$R
latentcor(X, types = c("con", "bin", "ter", "tru"), method = "original")$R

## ----speed, warning = FALSE, message = F--------------------------------------
library(microbenchmark)
#microbenchmark(latentcor(X, types = c("con", "bin", "ter", "tru"), method = "approx", ratio = 0.99)$R)
#microbenchmark(latentcor(X, types = c("con", "bin", "ter", "tru"), method = "approx", ratio = 0.4)$R)
microbenchmark(latentcor(X, types = c("con", "bin", "ter", "tru"), method = "original")$R)

## ---- message = FALSE---------------------------------------------------------
set.seed("234820")
X = gen_data(n = 6, types = c("con", "bin", "ter", "tru"))$X
X
out = latentcor(X, types = c("con", "bin", "ter", "tru"))
out$Rpointwise
eigen(out$Rpointwise)$values

## ---- message = TRUE----------------------------------------------------------
out = latentcor(X, types = c("con", "bin", "ter", "tru"))

## -----------------------------------------------------------------------------
out = latentcor(X, types = c("con", "bin", "ter", "tru"), nu = 0.001)
out$Rpointwise
out$R

## -----------------------------------------------------------------------------
set.seed("234820")
X = gen_data(n = 100, types = c("con", "bin", "ter", "tru"))$X
out = latentcor(X, types = c("con", "bin", "ter", "tru"), nu = 0.001)
out$Rpointwise
out$R

