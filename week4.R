
 # -----------------------------------------------------------------------------
 #                Week 4
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
 SE <- 6.87 / sqrt(1000) 	
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
 
 SE <- sd(pause) / sqrt(length(pause)) 	
 print(paste('SE:', SE, 'words'))
 qnorm(0.025)
 
 CI_high <- mean(pause) + (1.96*SE)
 CI_low <- mean(pause) - (1.96*SE)
 print(paste('95% CI :', CI_low, '-', CI_high, 'words'))
 
 # Now using the data for number of words per sentence we want to determine how many sentences we should sample know our sample mean is accurate to 1% of the true population mean
 # The error tolerated is the second half of our CI equation: error tolerated = 1.96 *SE
 
 # Here we set the confidence to 95% (by the 1.96) and determined an error tolerated of 0.01
 
 
 # We can rearrange to get: SE = 0.01/1.96
 # Our SE formula: SE = sigma / sqrt(N)  can be substituted in place of SE
 # Now we have: sigma / sqrt(N) = 0.01/1.96 
 # We also know the standard deviation is 6.87 words
 # Which leaves us with:
 N <- (6.87/ (0.01/1.96) )^2 
 print(paste('Sample size:', N))
 
 # a) Calculate the sample size required for the pause experiment to know the sample mean is accurate to 5% with a 99% confidence interval
 
 # Given data
 pause <- c(25,32,30,20,15,34,36,28,22,31,27,33,26,19,21,20,26,35,17,24)
 
 sample_mean <- mean(pause)  # Mean of the pause times
 sample_sd <- sd(pause)      # Sample standard deviation
 z_score <- 2.576            # Z-score for 99% confidence level
 
 tolerated_error <- 0.05 * sample_mean
 
 SE <- tolerated_error / z_score
 N <- (sample_sd / SE) ^ 2
 
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
 
 

 #Exercise 1
 
 # Using the data below, determine the 95% and 99% confidence intervals.
 #Use the code from lecture to determine confidence intervals:
 #This is the code from lecture.
 
 
 grades <- c(64.86, 78.00, 77.29, 70.43, 77.37, 65.63, 82.59, 81.44, 69.06, 82.30,
             76.78, 75.20, 82.29, 74.29, 75.37, 71.84, 78.19, 78.48, 82.01,85.59,
             90.53, 75.68, 82.28, 89.96, 86.01, 79.36, 87.10, 75.15, 80.56, 59.85,
             72.74, 58.95, 70.10, 78.50, 78.80, 79.31, 74.14, 81.80, 86.66, 75.04,
             74.95, 83.59, 79.11, 86.67, 64.35, 80.52, 81.98, 75.86, 69.70, 75.06,
             72.10, 83.90, 83.76, 66.84, 87.94, 90.38, 73.09, 82.15, 79.54, 93.62,
             85.42, 71.08, 82.46, 71.04, 74.99, 73.10, 84.77, 88.03, 72.41, 85.54,
             76.76, 85.66, 74.19, 71.75, 71.47, 77.44)
 
 
 
 

 # Step 1: Compute necessary statistics
 n <- length(grades)     # Sample size
 mean_grades <- mean(grades)  # Sample mean
 sd_grades <- sd(grades)      # Sample standard deviation
 
 # Step 2: Compute Standard Error (SE)
 SE <- sd_grades / sqrt(n)
 
 # Step 3: Compute confidence intervals
 
 # 95% Confidence Interval
 z_95 <- 1.96  # Z-score for 95% confidence
 error_95 <- z_95 * SE  # Margin of error
 lower_95 <- mean_grades - error_95
 upper_95 <- mean_grades + error_95
 
 # 99% Confidence Interval
 z_99 <- 2.576  # Z-score for 99% confidence
 error_99 <- z_99 * SE  # Margin of error
 lower_99 <- mean_grades - error_99
 upper_99 <- mean_grades + error_99
 
 # Print results
 print(paste("95% Confidence Interval: (", round(lower_95, 2), ",", round(upper_95, 2), ")"))
 print(paste("99% Confidence Interval: (", round(lower_99, 2), ",", round(upper_99, 2), ")"))
 
 
 # -----------------------------------------------------------------------------
 #                T-test
 # -----------------------------------------------------------------------------
 
 # If the sample sizes are not large (N<30) but they are approximately normal, you can use a t-test statistic instead of z-score
 
 
 ## Independent samples t-test ##
 
 # We want to compare the number of words produced in French by two groups of participants, one who received a treatment (10 week intensive French class) and one who did not (10 week regular schedule French class). 

 
 treatment <- c(26, 24, 28, 22, 20, 23, 25, 29, 27, 21)
 control <- c(18, 20, 16, 22, 24, 19, 17, 23, 21, 25)
 
 #Write the null hypothesis:
 
 #Write the two-sided alternative hypothesis:
 
 #Null hypothesis: The null hypothesis is that there is no difference between the mean number of words produced by the treatment and control groups.
 
 #Alternative hypothesis: The alternative hypothesis is that there is a significant difference between the mean number of words produced by the treatment and control groups.
 
 # Base R has a function for running a t-test statistic called t.test()
 # The parameters for this function are: t.test(x, y, alternative=, mu=)
 # where x and y are the datasets
 # alternative is the type of test, it be can set to 'two.sided' (default), 'less', 'greater'
 # and mu is difference between means assumed by the null hypothesis, often 0
 
 #Run the test, we do not need to specify paired = FALSE, because it is the default
 t.test(treatment, control)
 
 #Interpret the results
 #To interpret the results, you can use the p-value to determine whether the results are statistically significant or not. If the p-value is less than the chosen significance level (e.g., 0.05), then the results are statistically significant and you can reject the null hypothesis.
 # **The t-value**: The t-value is a statistical measure that represents the size of the difference between two means in terms of the variability of the data. It is calculated by dividing the difference between the sample means by the standard error of the difference. The larger the t-value, the greater the evidence against the null hypothesis, and the smaller the p-value.
 #  **The degrees of freedom**: The degrees of freedom (df) is a parameter that determines the shape of the t-distribution. It represents the number of values in a sample that are free to vary after taking into account certain constraints, such as the sample size and the number of groups being compared. 
 #In an independent samples t-test, the degrees of freedom is equal to the sum of the sample sizes minus two.
 #In general, the higher the degrees of freedom, the more accurate the t-test will be in detecting true differences between groups.
 #  **The p-value**: To interpret the results, you can use the p-value to determine whether the results are statistically significant or not. If the p-value is less than the chosen significance level (e.g., 0.05), then the results are statistically significant and you can reject the null hypothesis.
 
 
 #To run a one-sided t-test, you can specify the alternative argument in the t.test() function. 
 #For example, to test whether the mean number of words produced by the treatment group is greater than the control group:
 
 
 t.test(treatment, control, alternative = "greater")
 
 #If the one-sided t-test predicts that the number of groups produced by the treatment group will be smaller, then use 'less'
 t.test(treatment, control, alternative = "less")
 
 #We can also change the confidence level:
 
 t.test(treatment, control, alternative = "greater", conf.level = 0.99)
 

 
 #1. Here are the normal body temperatures for 25 males and females. Perform a two-sample test to see whether the population means are equivalent. Is the difference statistically significant at the 5% level? 
 
 male <-c(97.3,97.3,97.8,97.5,97.7,97.1,97.2,97.3,97.3,96.7,97.4,96.6,96.5,97.7,97.7,97.4,97.1,97.6,97.7,97.8)
 female <- c(96.4,96.7,96.8,97.2,97.2,97.4,97.6,97.7,97.7,97.8,97.8,97.8,97.9,97.9,97.9,98,98,98,98,98,98.1,98.2,98.2,98.2,98.2)
 
 # a) What are the null and alternative hypotheses?
 # Null: Temperatures are the same between males and females
 # Alternative: Temperatures are not the same between males and females
 
 # b) Is this a directional test?
 # Bi-directional, we care if there is a difference either way
 
 
 
 # c) Is the data normal?'
 shapiro.test(male)
 shapiro.test(female)
 print(paste('The p-values for the Shapiro-Wilk normality test are 0.04149 and 0.001045 indicating both sets of data are normal and we can use the T-Test'))
 
 # d) Run the test statistic, show your work. Can you reject the null hypothesis?
 t.test(male, female, alternative='two.sided', mu=0)
 
 # e) What is the p-value of your test statistic?
 print('The p-value for the T-Test is 0.006869, meaning it is statistically significant and we can reject the null hypothesis')
 
 #2. Here are the ages for the mothers and fathers of 20 babies. Do a significance test of the null hypothesis of equal ages against a one-sided alternative that the dads are older at the 5% level.
 
 mothers <- c(32,34,31,32,51,27,38,33,35,35,36,37,34,31,33,32,36,40,32,31)
 fathers <- c(38,38,25,30,32,22,34,26,25,35,30,38,36,20,36,37,19,22,38,33)
 
 # a) What are the null and alternative hypotheses?
 # Null: There is no difference between the parent's ages
 # Alternative: The dads are older
 
 # b) Is this a directional test?
 # Uni-directional, we care if the fathers are older


 # c) Is the data normal?'
 shapiro.test(mothers)
 shapiro.test(fathers)
 print(paste('The p-values for the Shapiro-Wilk normality test are 0.001256 and 0.02517 indicating both sets of data are normal and we can use the T-Test'))
 
 # d) Run the test statistic, show your work. Can you reject the null hypothesis?
 t.test(fathers, mothers, alternative='greater')				# fathers must be first
 
 # e) What is the p-value of your test statistic?
 print('The p-value for the T-Test is 0.9769, meaning it is not statistically significant and we cannot reject the null hypothesis')
 
 

 #3. Students wishing to graduate must achieve a specific score on a standardized test. Those failing must take a course and then attempt the test again. Suppose 12 students are enrolled in the extra course and their two test scores are given in 'before' and 'after'. Do a t-test to see if there was any improvement in the students’ mean scores following the class at the 1% level.
 
 before <- c(21,15,21,13,15,22,22,23,20,6,21,23)
 after <- c(17,16,20,20,18,18,22,19,18,15,20,7)
 
 # a) What are the null and alternative hypotheses?
 # Null: There is no difference between the scores before and after the extra course
 # Alternative: The extra course improves the after scores
 
 # b) Is this a directional test?
 # Uni-directional, we are asking if the after scores are higher than the before scores

 # c) Is the data normal?'
 shapiro.test(before)
 shapiro.test(after)
 print(paste('The p-values for the Shapiro-Wilk normality test are 0.01117 and 0.01057 indicating both sets of data are normal and we can use the T-Test'))
 
 # d) Run the test statistic, show your work. Can you reject the null hypothesis?
 t.test(after, before, alternative='greater', paired=TRUE)		# after must be the first parameter, and paired test
 
 # e) What is the p-value of your test statistic?
 print('The p-value for the T-Test is 0.703, meaning it is not statistically significant and we cannot reject the null hypothesis')
 
 #####Exercises
 
 #Exercise. 15 students in a statistics class are asked to ranked their understanding of statistics on a scale from 1-20 at the beginning and end of term. Does the statistics course increase student understanding at the 5% significance level?
 
 beginning <- c(10,8,1,6,9,7,9,4,8,8,9,1,9,4,9)
 end <- c(9,20,15,13,4,7,4,10,7,6,7,19,7,9,19)
 
 # a) What are the null and alternative hypotheses?
 
 # b) Is this a directional test?
 

 # c) Is the data normal?'
 # d) Run the test statistic, show your work. Can you reject the null hypothesis?
 
 # e) What is the p-value of your test statistic?
 
 
 
 #Exercise. A stats TA believes one tutorial seems taller than the other. They collect heights (cm) for 15 people in each tutorial and want to see if they are different with a 5% significance level.
 tutorial1 <- c(153,154,179,151,190,147,155,161,160,156,160,161,176,178,159)
 tutorial2 <- c(173, 157, 160, 168, 160, 168, 168, 157, 168, 168, 168, 160, 173, 165, 159)
 
 # a) What are the null and alternative hypotheses?
 # b) Is this a directional test?
 # d) Is the data normal?
 # d) Run the test statistic, show your work. Can you reject the null hypothesis?
 # e) What is the p-value of your test statistic?
 
 # Exercise Two groups of 20 people reported the number of coffees they drink per week. Test if university students drink more coffee than recent graduates a the 1% significance level. The average Canadian drinks 16.5 cups of coffee per week.
 universityStudents <- c(21, 14, 15, 24, 14, 13, 14, 15, 24, 18, 24, 20, 15, 16, 17, 21, 19, 19, 22, 18)
 recentGrads <- c(16,21,17,17,21,14,20,18,20,19,16,18,12,9,21,13,19,21,20,21)
 
 # a) What are the null and alternative hypotheses?
 # b) Is this a directional test?
 # c) Is the data normal?
 # d) Run the test statistic, show your work. Can you reject the null hypothesis?
 # e) What is the p-value of your test statistic?
 
 
 
 