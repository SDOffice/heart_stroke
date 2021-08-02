library(plumber)

r <- plumber::plumb(file = "code.R")
r$run(host="0.0.0.0", port=7000)
