simple_lm <- function(x, y) {
    SXY <- sum((x-mean(x))*(y-mean(y)))
    SXX <- sum((x-mean(x))^2)
    b1 <- SXY/SXX
    b0 <- mean(y)-b1*mean(x)
    return(list(intercept = b0, reg_coef = b1))
}