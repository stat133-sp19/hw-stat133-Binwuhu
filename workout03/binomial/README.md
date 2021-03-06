## General Idea
The package `"binomial"` includes implemented functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.

## Creating a binomial variable

The first step is to create a `binomial variable` object with the function `bin_variable()`:

```{r setup}
library(binomial)
```

```{r}
binvar <- bin_variable(trials=10,prob=0.4)
binvar
```
The function bin_variable() takes two argument, `trials` stands for the number of trials and `prob` stands for the probability of success.

```{r}
summary(binvar)
```
The `summary()` can takes one binomial random variable as paramaters, and present a nicely-formed table of function measures



## Measures of Binomial Random Variables

There are 5 measuring functions in this package. Both of them takes two argument: *trials* and *prob*

 `bin_mean()`: calculate the mean of binomial random variable
 `bin_variance()`: calculate the variance of binomial random variable
 `bin_mode()`: calculate the mode of binomial random variable
 `bin_skewness()`: calculate the skewness of binomial random variable
 `bin_kurtosis()`: calculate the kurtosis of binomial random variable


```{r}
aux_mean(10, 0.3)
aux_variance(10, 0.3)
aux_mode(10, 0.3)
aux_skewness(10, 0.3)
aux_kurtosis(10, 0.3)
```


## Binomial dirstributions and cumulative


Also, the package contains two main functions `bin_cumulative()`. `bin_distribution()` , which will output a table that display the success,probability, cumulative regarding binomial distribution.

```{r}
dist1 <- bin_distribution(10, 0.3)
dist1
dist2 <- bin_cumulative(10, 0.3)
dist2
```


You can also use the function `plot()` to create plots of the binomial probability distribution and cumulative.

```{r}
plot(dist1)
plot(dist2)
```
