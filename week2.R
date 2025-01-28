
 
 
 # -----------------------------------------------------------------------------
 #                Data frames
 # -----------------------------------------------------------------------------
 
 #Data frames are very important objects in data analysis. 
 #Data frames are 2-dimensional objects with columns and rows.
 
 library(languageR)
 #We'll use the dataset beginningReaders from the package languageR.
 
 #BeginningReaders: Visual lexical decision latencies for beginning readers (8 year-old Dutch children).
 
 #Print the first 10 rows of the data frame beginningReaders
 
 
 head(beginningReaders)
 
 #How many columns does the data frame have?
 
 ncol(beginningReaders)
 
 #How many rows does the data frame have?
 
 nrow(beginningReaders)
 
 #What are the names of the columns?
 
 names(beginningReaders)
 
 
 #We can also visualize the data frame
 
 View(beginningReaders)
 
 #Print a summary of the data frame
 
 summary(beginningReaders)
 
 #To subset columns we will use the $
 
 beginningReaders$Word
 
 beginningReaders$LogRT
 
 beginningReaders$Subject
 

 #We can also use the square brackets to subset rows and columns
 
 #First number inside of the [] is the row, the second number is the column.
 
 beginningReaders[1,2] #first row second column
 
 beginningReaders[2,2] #second row second column
 
 beginningReaders[1,5] #first row fifth column
 
 
 
 
 # -----------------------------------------------------------------------------
 #                Plotting
 # -----------------------------------------------------------------------------
 
 
 #Base graphics are often constructed piecemeal, with each aspect of the plot handled separately through a particular function call.
 #Usually you start with a plot function (such as plot, hist, or boxplot), 
 #then you use annotation functions (text, abline, points) to add to or modify your plot.
 
 
 #As you'll see, most of the base plotting functions have many arguments, for example, setting the title, 
 #labels of axes, plot character, etc. Some of the parameters can be set when you call the function or they can be added later in a separate function call.
 
 
 #Now we'll go through some quick examples of basic plotting.
 #install.packages("languageR")
 
 library(languageR)
 
 #We see the dataset contains 13 columns of data. 
 
 ncol(beginningReaders)
 
 #First we'll do a simple histogram of this LogRt column to show the distribution of the log-transformed reaction time (in ms).
 
 #Use the R command hist with the argument beginningReaders$LogRT.   
 
 
 #Now, we can modify the x axis title to Log transformed reaction time
 #Type hist(beginningReaders$LogRT, xlab = "Log transformed reaction time")
 
 
 # Sometimes we are not interested in the raw counts of observations in a bin, but rather 
 # we want to know the PROPORTIOIN of observations relative to the total number of 
 # observations in the data. In these cases we use a density plot:
 
 #Next, we will do a density plot
 
 d = density(beginningReaders$LogRT) #returns density data
 plot(d) #plot results
 
 
 
 # A different way to visualise the distribution of values is using a boxplot or 
 # a box-and-whisker plot. The values are on the y-axis and the distribution is shown 
 # based on percentiles.
 
 boxplot(beginningReaders$LogRT) 
 
 # The box indicates values between the 25th and 75th percentile (the interquartile range).
 # The median value is indicated by the thick black line. The dotted lines or whiskers
 # show the maximum and minimum values without outliers. Any data points (shown as circles) 
 # are known as outliers. Normally distributed data will have a symetric boxplot with no outliers
 # and the median should be close to the middle of the box (IQR)
 
 
 
 #Next we'll do a scatter plot.
 #We'll want a scatter plot of LogRT as a function of OrthLength.
 
 #Type plot(LogRT~OrthLength, beginningReaders)
 
 #Note that boxplot, unlike hist, did NOT specify a title and axis labels for you automatically.
 
 #Let's call boxplot again to specify labels. (Use the up arrow to recover the previous command and save yourself some typing.) 
 #We'll add more arguments to the call to specify labels for the 2 axes. Set xlab equal to "Orthographic length" and ylab equal to "Log transformed Reaction Time". 
 
 #Type plot(LogRT~OrthLength, beginningReaders, xlab="Orthographic length", ylab="Log transformed reaction time")
 
 
 
 ###QQplot###
 
 # Before we can do any statistical testing on our data, we need to know whether it 
 # is  normally distributed. One way to check is using the qqnorm() and qqline() functions
 # which plots the data points we have against the values we would expect to see if the data 
 # was normally distributed. Remember that normal distributions have a constant proportion of 
 # data in each half of the distribution. Remember also, that there is a percentage 
 # of data lies between 1SD, 2SD, 3SD.
 
 qqnorm(beginningReaders$LogRT)
 qqline(beginningReaders$LogRT)
 
 # If the data is normally distributed (parametric), all or most of the points will
 # fall on the qqline. In this case, many points are above the qqline, so the data is
 # most likely non-parametric. Below is an example of parametric data:
 
 x<-rnorm(100)
 qqnorm(x)
 qqline(x)
 
 
 # -----------------------------------------------------------------------------
 #                Z-scores
 # -----------------------------------------------------------------------------
 
 #Remember that a z-score is a standardized value that gives you an idea of how far from the meana data point is.
 #Each z-score value cuts off a percentile of the distribution.
 #Negative z-scores will refer to percentiles below 50% and high z-scores will refer to
 # percentiles above 50%.
 
 #Imagine that you are a speech language pathologist and you are assessing a child that is 2 years old and produces words with a mean of 3.2 syllables per word.
 #You want to know what is the percentage of children that does better that the child you are assessing.
 
 #This is a vector with the means of 30 children:
 
 means_syllables_child = c(3.2,3,4.5,3,2,2,2,2.8,3.2,2.5,2,3,4.5,3,2,2,2,2.8,3.2,2.5,2,3,4.5,3,2,2,2,2.8,3.2,2.5)
 
 #What is the mean of the samples means?
 
 mean(means_syllables_child)
 
 
 #And the standard deviation?
 
 sd(means_syllables_child)
 
 #We know already that our child does better than the mean. We, thus, expect a positive z-score
 
 #The first thing that you need to do is to convert these means into z-scores.
 #We subtract the data point from the mean and divide it by the standard deviation.
 z_syllables = (3.2 - mean(means_syllables_child))/sd(means_syllables_child)
 z_syllables  
 # Our z-score is 0.6052632. Now we need to know what percentage of the data this z-score cuts off.
 #If I want to know what percentile a z-score value cuts off in R, I do not need to look up the z-score table, R does it for me!
 
 #pnorm is the function that replaces the table of probabilites and Z-scores
 #pnorm takes a z-score and converts it into a percentile
 percentile <- pnorm(z_syllables)
 
 #display percentile
 percentile #this means that a z-score of 0.6 cuts off 72.75% of the data. In other words,
 #the child we are assessing does better than 72.75% of the children and worse than 27.25% of the children.
 
 #We can also do the reverse process. We can calculate the z-score needed to cut off a percentage of our data.
 #What is the z-score needed to cut off 2.5% percent of our data?
 
 #qnorm takes a percentile and converts it into z-score.
 qnorm(0.025)
 
 #-1.96 will be a very important number from now on! 
 
 
 # -----------------------------------------------------------------------------
  # -----------------------------------------------------------------------------
 #                Time for practice!
 # -----------------------------------------------------------------------------
 # -----------------------------------------------------------------------------
 
 
 
 
 # -----------------------------------------------------------------------------
 #                Practice central tendency
 # -----------------------------------------------------------------------------
 #Exercises from Verzani (2005)
 #We will use the package UsingR
 
 install.packages("UsingR")
 library(UsingR)
 
 #1. One can generate random data with the "r"-commands. For example
 x = rnorm(100)
 #produces 100 random numbers with a normal distribution. Create two different histograms for two different
 #times of defining x as above. Do you get the same histogram?
 
 
 #2. Make a histogram and boxplot of these data sets from these Simple data sets: south, crime and aid. Which of
 #these data sets is skewed?
 #To visualize the outliers we can create a boxplot. The values that are single dots in the boxplot are outliers.
 #Which data set has outliers, which is symmetric? Example: Type boxplot(south) 
 
 
 
 #3. For the Simple data sets bumpers, firstchi, math make a histogram. Try to predict the mean, median and
 # standard deviation. Check your guesses with the appropriate R commands.
 
 
 #4. The number of O-ring failures for the first 23 flights of the US space shuttle Challenger were
 # 0 1 0 NA 0 0 0 0 0 1 1 1 0 0 3 0 0 0 0 0 2 0 1
 #(NA means not available - the equipment was lost). Make a table of the possible categories (use the function table()). Try to find the
 #mean. (You might need to try mean(x,na.rm=TRUE) to avoid the value NA, or look at x[!is.na(x)].)
 
 failures <- c(0, 1, 0, NA, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 2, 0, 1)
 
 #5. Create a density estimate to the Simple dataset pi2000 .
 
 
 
 #6. The data set normtemp (UsingR) contains body measurements for 130 healthy,
 #randomly selected individuals. The variable temperature contains normal body
 #temperature. Make a histogram. Estimate the sample mean body temperature, and then
 #check using mean(). Calculate the standard deviation using sd() and the range using range().
 
 
 #5. The lawsuits (UsingR) data set contains simulated data on the settlement amounts
 #of 250 common fund class actions in $10,000s. Look at the differences between the mean
 #and the median. Explain why some would say the average is too high and others would
 #say the average is the wrong way to summarize the data. 
 
 #6. The data set babyboom (UsingR) contains data on the births of 44 children in a
 #one-day period at a Brisbane, Australia, hospital. Make a histogram of the wt variable,
 #which records birth weight. Is it symmetric or skewed?The variable running. time records the time after midnight of each birth. The
 #command diff (running.time) records the differences or inter-arrival times. Make a
 #histogram of this data. What is the general shape? Is it uniform? 
 
 # -----------------------------------------------------------------------------
 #                Exercise 1. Practice normality
 # -----------------------------------------------------------------------------
 
 # a) What are the properties of a normal distribution? 
 
 
 # b) Use the rnorm() function to make a vector of 200 normally distributed values
 # with a mean of 10 and a standard deviation of 1.5
 
 # c) Now we want to visualise the distribution of values from b). Hint: Use the 
 # hist() function
 
 
 
 # -----------------------------------------------------------------------------
 #                Exercise 2. Visualizing distributions
 # -----------------------------------------------------------------------------
 
 # Exercise 2: Visualise the distribution of values in the following data:
 # a)
 mtcars$wt
 
 # b) 
 lexdec$Frequency
 
 # c)
 iris$Sepal.Length
 
 # -----------------------------------------------------------------------------
 #                Exercise 3. Testing normality
 # -----------------------------------------------------------------------------
 
 
 
 # Let's get a little more practice. For each set of values: 
 # (i) determine the mean and standard deviation, 
 # (ii) plot the data and indicate whether it is normally distributed, use hist() and qqplot()

 
 # a)
 library(UsingR)
 salary <- exec.pay
 
 
 # b)
 mileage <- mtcars$mpg
 
 
 # c)
 grades <- c(64.86, 78.00, 77.29, 70.43, 77.37, 65.63, 82.59, 81.44, 69.06, 82.30,
             76.78, 75.20, 82.29, 74.29, 75.37, 71.84, 78.19, 78.48, 82.01,85.59,
             90.53, 75.68, 82.28, 89.96, 86.01, 79.36, 87.10, 75.15, 80.56, 59.85,
             72.74, 58.95, 70.10, 78.50, 78.80, 79.31, 74.14, 81.80, 86.66, 75.04,
             74.95, 83.59, 79.11, 86.67, 64.35, 80.52, 81.98, 75.86, 69.70, 75.06,
             72.10, 83.90, 83.76, 66.84, 87.94, 90.38, 73.09, 82.15, 79.54, 93.62,
             85.42, 71.08, 82.46, 71.04, 74.99, 73.10, 84.77, 88.03, 72.41, 85.54,
             76.76, 85.66, 74.19, 71.75, 71.47, 77.44)
 
 
 # -----------------------------------------------------------------------------
 #                Exercise 3. Practice z-scores
 # -----------------------------------------------------------------------------
 
 
 #Using the vector grades, answer the questions below:
 
 #What is the percentage of students that did worse than the student that got 79?
 
 #What is the percentage of students that did better than the student that got 79?
 
 #What is the grade that cuts off the lowest 5% of the data? (Hint: Raw score = mean + Z*SD)
 #In other words, what is the lowest grade among the worse 5% of students?
 #What is the grade that cuts off the highest 5% of the data?
 #In other words, what is the highest grade among the worse 5% of students?
 
 
 