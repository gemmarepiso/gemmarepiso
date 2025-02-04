
 
 # -----------------------------------------------------------------------------
 #              Answers
 # -----------------------------------------------------------------------------

 # a) What are the properties of a normal distribution? 
 
 # A normal distribution is defined by its mean and standarad deviatioin. A normal 
 # distribution has a mean of 0 and a standard deviation of 1.
 
 # b) Use the rnorm() function to make a vector of 200 normally distributed values
 # with a mean of 10 and a standard deviation of 1.5
 rnorm(200, mean = 10, sd = 1.5)
 
 # c) Now we want to visualise the distribution of values from b). Hint: Use the 
 # hist() function
 hist(rnorm(200, mean = 10, sd = 1.5))
 
 
 
 
 # -----------------------------------------------------------------------------
 #                Exercise 2. Visualizing distributions
 # -----------------------------------------------------------------------------
 
 # Exercise 2: Visualise the distribution of values in the following data:
 
 #Remember: A QQ plot is a scatterplot created by plotting two sets of quantiles against one another. If both sets of quantiles came from the same distribution, we should see the points forming a line that's roughly straight. 
 #(Understanding qqplots: https://library.virginia.edu/data/articles/understanding-q-q-plots)
 mtcars$wt
 
 plot(density(mtcars$wt))
 qqnorm(mtcars$wt)
 qqline(mtcars$wt)
 # Not normal
 
 # b) 
 lexdec$Frequency
 
 plot(density(lexdec$Frequency))
 qqnorm(lexdec$Frequency)
 qqline(lexdec$Frequency)
 #Normal
 
 # c)
 iris$Sepal.Length
 
 plot(density(iris$Sepal.Length))
 qqnorm(iris$Sepal.Length)
 qqline(iris$Sepal.Length)
 # close to normal
 # -----------------------------------------------------------------------------
 #                Exercise 3. Testing normality
 # -----------------------------------------------------------------------------
 
 
 
 # Let's get a little more practice. For each set of values: 
 # (i) determine the mean and standard deviation, 
 # (ii) plot the data and indicate whether it is normally distributed, use hist() and qqplot()
 # (iv) find the standard error. Hint: for (iii) you need to know how large the 
 # sample is (ie how many values are in the vector)
 # a)
 library(UsingR)
 salary <- exec.pay
 
 
 # (i)
 mean(salary) # 59.89
 sd(salary) # sd is 207.0
 
 # (ii)
 hist(salary) #need more breaks than the default to see trends
 hist(salary, breaks = 100)
 plot(density(salary))
 qqnorm(salary)
 qqline(salary)
 #not normal
 
 # (iii)
 sd = sd(salary)
 N = length(salary)
 
 se = sd/sqrt(N)
 se #14.68
 
 # b)
 mileage <- mtcars$mpg
 
 #(i)
 mean(mileage)
 sd(milage)
 
 # (ii)
 hist(mileage) 
 plot(density(mileage))
 qqnorm(mileage)
 qqline(mileage)
 #not normal
 
 # (iii)
 se = sd(mileage)/sqrt(length(mileage))
 se # 1.07
 
 # c)
 grades <- c(64.86, 78.00, 77.29, 70.43, 77.37, 65.63, 82.59, 81.44, 69.06, 82.30,
             76.78, 75.20, 82.29, 74.29, 75.37, 71.84, 78.19, 78.48, 82.01,85.59,
             90.53, 75.68, 82.28, 89.96, 86.01, 79.36, 87.10, 75.15, 80.56, 59.85,
             72.74, 58.95, 70.10, 78.50, 78.80, 79.31, 74.14, 81.80, 86.66, 75.04,
             74.95, 83.59, 79.11, 86.67, 64.35, 80.52, 81.98, 75.86, 69.70, 75.06,
             72.10, 83.90, 83.76, 66.84, 87.94, 90.38, 73.09, 82.15, 79.54, 93.62,
             85.42, 71.08, 82.46, 71.04, 74.99, 73.10, 84.77, 88.03, 72.41, 85.54,
             76.76, 85.66, 74.19, 71.75, 71.47, 77.44)
 
 # (i)
 mean(grades)
 sd(grades)
 
 # (ii)
 hist(grades) 
 plot(density(grades))
 qqnorm(grades)
 qqline(grades)
 #Normal
 
 #(iii)
 se = sd(grades)/sqrt(length(grades))
 se #0.82
 
 # -----------------------------------------------------------------------------
 #                Exercise 3. Practice z-scores
 # -----------------------------------------------------------------------------
 
 #Using the vector grades, answer the questions below:
 
 #1. What is the percentage of students that did worse than the student that got 79?
 mean(grades)
 sd(grades)
 
 z = (79 - 77.93) / 7.15
 z
 #0.1496503
 
 #pnorm is the function that replaces the table of probabilites and Z-scores at the back of the statistics textbook.
 #From a z-score, we get a percentile.
 pnorm(0.1496503)
 
 #0.5594797    #56%
 
 
 #2. What is the percentage of students that did better than the student that got 79?
 
 100-56 = 44
 
 #44% 
 
 #3. What is the grade that cuts off the lowest 5% of the data? (Hint: Raw score = mean + Z*SD)
 #In other words, what is the lowest grade among the worse 5% of students?
 
 
 #First we need the z-score
 qnorm(0.05)
 #z-score of -1.644854
 
 #Now we need the grade
 #To calculate Raw score use Raw score = mean + Z*SD
 77.93 + (-1.644854 * 7.15)
 
 
 #66.16929
 
 #4. What is the grade that cuts off the highest 5% of the data?
 #In other words, what is the highest grade among the worse 5% of students?
 
 
 qnorm(0.95)
 # z-score of 1.644854
 77.93 + (1.644854 * 7.15)
 
 #89.69
 
 
 # -----------------------------------------------------------------------------
 #                Week 3
 # -----------------------------------------------------------------------------
 
 
 # -----------------------------------------------------------------------------
 #                Standard error, confidence intervals, sample sizes
 # -----------------------------------------------------------------------------
 
 
 
 # The there is a frequency distribution for the population and another distribution for the mean
 # The mean of the sampling distribution for the mean is the same as the mean of the population
 # However, variation in the population can give a different mean depending on the subgroup that is sampled
 # This variation is converyed by the standard deviation of the sampling distribution, also called the standard error of the mean
 # The equation for standard error (SE) is :  SE = sigma / sqrt(N) 		where sigma is standard deviation and N is the sample size
 
 #  Number of Words
 # A sample of 100 sentences has a mean length of 14.21 words and a standard deviation of 6.87 words
 # Let's determine the standard error (SE) of the mean
 # Substitute the values into the formula 
 SE <- 6.87 / sqrt(100) 	
 print(paste('SE:', SE, 'words'))
 
 # But what does this mean for the variation in the sample mean?
 # We want an interval of estimate or confidence interval for the sample mean
 # If we sampled 12 more groups of 100 sentences we want the mean for 95% of the groups to be in this interval 
 # To set a 95% confidence interval (CI) we use the following equation: sample mean +/- 1.96(SE)
 # 1.96 is the critical z-score that will encompass 95% of all sample means
 # We can also use 2.58 for a 99% CI 
 
 CI_high <- 14.21 + (1.96*SE)
 CI_low <- 14.21 - (1.96*SE)
 print(paste('95% CI :', CI_high, '-', CI_low, 'words'))
 
 
 # The following data is the length of pause between sentences in measured in milliseconds
 pause <- c(25,32,30,20,15,34,36,28,22,31,27,33,26,19,21,20,26,35,17,24)
 
 # a) Calculate the sample mean of pause and the standard deviation
 # b) Calculate the standard error of the mean (SE)
 # c) Calculate the 95% confidence interval (CI) for the mean
 

 # Now using the data for number of words per sentence we want to determine how many sentences we should sample know our sample mean is accurate to 1% of the true population mean
 # The error tolerated is the second half of our CI equation: error tolerated = 1.96(SE)
 # Here we set the confidence to 95% (by the 1.96) and determined an error tolerated of 0.01
 
 # We can rearrange to get: SE = 0.01/1.96
 # Our SE formula: SE = sigma / sqrt(N)  can be substituted in place of SE
 # Now we have: sigma / sqrt(N) = 0.01/1.96 
 # We also know the standard deviation is 6.87 words
 # Which leaves us with:
 N <- (6.87/ (0.01/1.96) )^2 
 print(paste('Sample size:', N))
 
 # a) Calculate the sample size required for the pause experiment to know the sample mean is accurate to 5% with a 99% confidence interval
 
 
 
 # -----------------------------------------------------------------------------
 #                Testing normality
 # -----------------------------------------------------------------------------
 
 # A researcher wants to know whether concrete words occur more frequently than the average word.
 # Below is collection of frequency ratings for 81 concrete words. Decide what type 
 # of test will the researcher use. Make sure you visualise the data and justify your decision.
 
 set.seed(123)
 freqs <- rnorm(81, mean = 50, sd = 1)
 
 
 
 #Calculate mean and standard deviation
 
 mean(freqs)
 sd(freqs)
 
 #Calculate the confidence interval with a confidence level of 95%.
 #Remember, confidence intervals is a range of values so defined that there is a specified probability that the value of a parameter lies within it.
 se = sd(freqs)/sqrt(length(freqs))
 
 
 CI_high <- mean(freqs) + (1.96*se)
 CI_low <- mean(freqs) - (1.96*se)
 
 
 
 #Visualize the distribution of the data using a density plot and a qqplot.
 
 plot(density(freqs)) #promising, the density plot looks like it follows the normal distribution
 qqnorm(freqs)
 qqline(freqs) #data matches up well with the predicted values if the data were normal
 
 # We want to run a shapiro test to determine whether the data is normally distributed.
 
 #a. What is the null hypothesis in a Shapiro-Wilk test?
 
 # The null hypothesis is that the data is normally distributed.
 
 #b. Explain, in your own words, what does the significance level of 5% refer to and why we use it.
 
 # The p-value is the probability that our test statistic takes the value by chance. 
 # If the p-value lies below the 0.005, then we can reject the null hypothesis.
 
 #c. If our data is normally distributed, do we expect to reject the null hypothesis?
 
 #No, in this case, we do not want to reject the null hypothesis, because the null hypothesis states that the data is normally distributed.
 
 
 
 
 #Run a shapiro test and decide whether we should reject the null hypothesis:
 
 shapiro.test(freqs) #p > 0.05 which means we accept the null hypothesis that the data is normally distributed
 
 
 
 
 # -----------------------------------------------------------------------------
 #                Homework
 # -----------------------------------------------------------------------------
 
 #Exercise 1
 
 # Using the data below, determine the 95% and 99% confidence intervals.
 #Use the code from lecture (Lecture 4) to determine confidence intervals:
 #This is the code from lecture.
 
 
 grades <- c(64.86, 78.00, 77.29, 70.43, 77.37, 65.63, 82.59, 81.44, 69.06, 82.30,
             76.78, 75.20, 82.29, 74.29, 75.37, 71.84, 78.19, 78.48, 82.01,85.59,
             90.53, 75.68, 82.28, 89.96, 86.01, 79.36, 87.10, 75.15, 80.56, 59.85,
             72.74, 58.95, 70.10, 78.50, 78.80, 79.31, 74.14, 81.80, 86.66, 75.04,
             74.95, 83.59, 79.11, 86.67, 64.35, 80.52, 81.98, 75.86, 69.70, 75.06,
             72.10, 83.90, 83.76, 66.84, 87.94, 90.38, 73.09, 82.15, 79.54, 93.62,
             85.42, 71.08, 82.46, 71.04, 74.99, 73.10, 84.77, 88.03, 72.41, 85.54,
             76.76, 85.66, 74.19, 71.75, 71.47, 77.44)
 
 
 
 
 
 # 95% CIs
 
 
 
 # 99% CIs (Remember, now you need a z-score that cuts off 0.5% of your data in each side of the curve.)
 #Find Z(0.995) (the z-score for 99% confidence) 
 
 
 
 
 

 
 # Exercise 2:
 
 #State the null hypothesis for:
 
 #  An experiment testing whether echinacea decreases the length of colds.
 
 #H0:
 
 
 
 #A correlational study on the relationship between brain size and intelligence.
 #H0:
 
 #An investigation of whether a self-proclaimed psychic can predict the outcome of a coin flip.
 #H0:
 
 
 
 