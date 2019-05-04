#library(roxygen2)
# 1.1)Private Checker Functions
# Functions that test that whether the input values are valid

# title check_prob()
# description A private auxiliary function that tests if an input prob is a valid probability value (i.e. 0 ≤ p ≤ 1).
# param prob the probability
# return a message reflecting whether the prob is valid
check_prob <- function(prob){
  if (prob<=1 & prob>=0){
    return(TRUE)
  } else {
    stop('invalid prob value')
  }
}

# title check_trials()
# description a private auxiliary function that tests if an input trials is a valid value for number of trials (i.e. n is a non-negative integer).
# param trials number of trials
# return a message reflecting whether the trials is valid
check_trials <- function(trials){
  if (trials>=0 & trials%%1==0){
    return(TRUE)
  } else {
    stop('invalid trials value')
  }
}

# title check_success()
# description a private auxiliary function that tests if an input success is a valid value for number of successes (i.e. 0 ≤ k ≤ n).
# param success a vector of integer(s) for number of successes
# param trials number of trials
# return a message reflecting whether the success is a valid value for number of successes
check_success <- function(success,trials){
  for (i in success){
    if (i<0 | i%%1!=0){
      stop('invalid success value')
    } else if (i > trials){
      stop('success cannot be greater than trials')
    }
  }
  return(TRUE)
}


# 1.2 Private Auxiliary Funcitons
# All these functions take two arguments: trials and prob. And return the corresponding value from the computed summary measure.

# title aux_mean
# description to privately calculates the mean
# param trials number of trials
# param prob the probability
# return calculated mean
aux_mean <- function(trials,prob){
  return(trials*prob)
}

# title aux_variance
# description to privately calculates the variance
# param trials number of trials
# param prob the probability
# return calculated variance
aux_variance <- function(trials,prob){
  return(trials*prob*(1-prob))
}

# title aux_mode
# description to privately calculates the mode
# param trials number of trials
# param prob the probability
# return calculated mode
aux_mode <- function(trials,prob){
  m <- trials*prob + prob
  if (m%/%1 == m){
    return(c(m,m-1))
  } else {
    return(m%/%1)
  }
}

# title aux_skewness
# description to privately calculates the skewness
# param trials number of trials
# param prob the probability
# return calculated skewness
aux_skewness <- function(trials,prob){
  return((1-2*prob)/sqrt(trials*prob*(1-prob)))
}

# title aux_kurtosis
# description to privately calculates the kurtosis
# param trials number of trials
# param prob the probability
# return calculated kurtosis
aux_kurtosis <- function(trials,prob){
  return((1-6*prob*(1-prob))/(trials*prob*(1-prob)))
}


#examples
#aux_mean(10, 0.3) ## [1] 3
#aux_variance(10, 0.3) ## [1] 2.1
#aux_mode(10, 0.3) ## [1] 3
#aux_skewness(10, 0.3) ## [1] 0.2760262
#aux_kurtosis(10, 0.3) ## [1] -0.1238095



#' @title bin_choose
#' @description a main function that calculates the number of combinations in which k successes can occur in n trials.
#' @param n the number of (fixed) trials (n ≥ 0)
#' @param k the probability of success on each trial (0 ≤ p ≤ 1)
#' @return the number of combinations in which k successes can occur in n trials
#' @export
#' @example
#' bin_choose(n = 5, k = 2)
#' 10
#' bin_choose(5, 0)
#' 1
#' bin_choose(5, 1:3)
#' 5 10 10
bin_choose <- function(n,k){
  if (check_success(k,n)){
    return(factorial(n)/(factorial(k)*factorial(n-k)))
  } else {
    stop("k cannot be greater than n")
  }
}


#' @title bin_probability
#' @description a main function that calculates probability
#' @param success the number of (fixed) trials (n ≥ 0)
#' @param trials the probability of success on each trial (0 ≤ p ≤ 1)
#' @param prob the probability of success on each trial (0 ≤ p ≤ 1)
#' @return the number of combinations in which k successes can occur in n trials
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  result <- (prob^success)*(1-prob)^(trials-success)*bin_choose(trials, success)
  return(result)
}



#' @title bin_distribution
#' @description a main function that calculates probability
#' @param trials the probability of success on each trial (0 ≤ p ≤ 1)
#' @param prob the probability of success on each trial (0 ≤ p ≤ 1)
#' @return a data frame with the probability distribution: sucesses in the first column, probability in the second column

bin_distribution <- function(trials,prob){
  success <- c()
  probability <- c()
  for (i in 0:trials){
    success[i+1] <- i
    probability[i+1] <- bin_probability(i,trials,prob)
  }
  dat <- data.frame(cbind(success,probability))
  class(dat) <- c("bindis","data.frame")
  return(dat)
}

#' @export
plot.bindis <- function(x,...){
  barplot(x$probability,xlab="success",ylab="probability",border=NA)
}



#' @title bin_cumulative
#' @description a main function that calculates probability
#' @param trials the probability of success on each trial (0 ≤ p ≤ 1)
#' @param prob the probability of success on each trial (0 ≤ p ≤ 1)
#' @return a data frame with the probability distribution: sucesses in the first column, probability in the second column

bin_cumulative <- function(trials,prob){
  success <- c()
  probability <- c()
  cumulative <- c()
  for (i in 0:trials){
    success[i+1] <- i
    probability[i+1] <- bin_probability(i,trials,prob)
    if (i == 0){
      cumulative[i+1] <- probability[i+1]
    } else {cumulative[i+1] <- cumulative[i]+probability[i+1]}
  }
  dat <- data.frame(cbind(success,probability,cumulative))
  class(dat) <- c("bincum","data.frame")
  return(dat)
}

#' @export
plot.bincum <- function(x,...){
  plot(x$cumulative,xlab="successes",ylab="probability",type="o")
}


#' @title bin_variable
#' @description a main function that return a binomial random variable object
#' @param trials number of trials
#' @param prob probability of success
#' @return an object of class "binvar", a binomial random ravariable object
#' examples
#' bina <- bin_variable(trials = 10, p = 0.3)
#' bin1
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  lst <- list(trials, prob)
  names(lst) <- c("trials", "prob")
  class(lst) <- "binvar"
  lst
}

#' @export
print.binvar <- function(x,...) {
  cat('"Binomial variable"', "\n", "\n")
  cat("Parameters", "\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success:", x$prob, "\n")
  invisible(x)
}


#' @export
summary.binvar <- function(object,...) {
  sum <- list(
    trials <- object$trials,
    prob <- object$prob,
    mean <- aux_mean(object$trials, object$prob),
    variance <- aux_variance(object$trials, object$prob),
    mode <- aux_mode(object$trials, object$prob),
    skewness <- aux_skewness(object$trials, object$prob),
    kurtosis <- aux_kurtosis(object$trials, object$prob))
  names(sum) <- c("trials", "prob", "mean", "variance", "mode", "skewness", "kurtosis")
  class(sum) <- "summary.binvar"
  sum
}

#' @export
print.summary.binvar <- function(x,...) {
  cat('"Summary Binomial"\n\n')
  cat('Paramaters\n')
  cat('- number of trials:', summary.binvar(x)$trials, '\n')
  cat('- prob of success:', summary.binvar(x)$prob, '\n\n')
  cat('Measures', '\n')
  cat('- mean    :', summary.binvar(x)$mean, '\n')
  cat('- variance:', summary.binvar(x)$variance, '\n')
  cat('- mode    :', summary.binvar(x)$mode, '\n')
  cat('- skewness:', summary.binvar(x)$skewness, '\n')
  cat('- kurtosis:', summary.binvar(x)$kurtosis)
  invisible(x)
}

bin1 <- bin_variable(trials = 10, p = 0.3)
binsum1 <- summary(bin1)
binsum1


#Functions of measures
#' @title bin_mean
#' @description calculating the mean of binomial random variables
#' @param trials number of trials
#' @param prob probability of success
#' @return the calculated mean
#' @export
#' @examples
# bin_mean(10, 0.4)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  mean <- aux_mean(trials, prob)
  return(mean)
}


#' @title bin_variance
#' @description calculating the variance of binomial random variables
#' @param trials number of trials
#' @param prob probability of success
#' @return the calculated variance
# bin_variance
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  variance <- aux_variance(trials, prob)
  return(variance)
}


#' @title bin_mode
#' @description calculating the mode of binomial random variables
#' @param trials number of trials
#' @param prob probability of success
#' @return the calculated mode
# bin_mode
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bmode <- aux_mode(trials, prob)
  return(bmode)
}


#' @title bin_skewness
#' @description calculating the skewness of binomial random variables
#' @param trials number of trials
#' @param prob probability of success
#' @return the calculated skewness
# bin_skewness
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  skewness <- aux_skewness(trials, prob)
  return(skewness)
}


#' @title bin_kurtosis
#' @description calculating the kurtosis of binomial random variables
#' @param trials number of trials
#' @param prob probability of success
#' @return the calculated kurtosis
# bin_kurtosis
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  kurtosis <- aux_kurtosis(trials, prob)
  return(kurtosis)
}


