# -----------------------------------------------------------------------------
#                R interface
# -----------------------------------------------------------------------------

#The RStudio interface consists of several windows. You can change the size of the windows by
#dragging the grey bars between the windows.


#Bottom left is the console window (also called command window/line). Here you can type commands
#after the > prompt and R will then execute your command. This is the most important window, because
#this is where R actually does stuff.


#Top left is the editor window (also called script window). Here collections of commands (scripts)
# can be edited and saved. When you do not get this window, you can open it with 'File' > 'New' > 'R
# script'. Just typing a command in the editor window is not enough, it has to get into the command
# window before R executes the command. If you want to run a line from the script window (or the
# whole script), you can click 'Run' or press 'CTRL+ENTER' to send it to the command window.


# Top right is the workspace / history window. In the workspace window you can see which data and
# values R has in its memory. You can view and edit the values by clicking on them. The history
# window shows what has been typed before.


#Bottom right is the files / plots / packages / help / viewer window. Here you can open files, view
#plots (also previous plots), install and load packages or use the help function.



# Your working directory is the folder on your computer in which you are currently working. When you
# ask R to open a certain file, it will look in the working directory for this file, and when you
# tell R to save a data file or figure, it will save it in the working directory.



#Before you start working, you should set your working directory to where all your data and script
#files are or should be stored. Within RStudio you can go to 'Session' > 'Set working directory' >
#'Choose directory'. Please do this now.




# You can store your commands in files, the so-called scripts. These scripts have typically file
# names with the extension .R, e.g. foo.R.

#You can run (send to the console window) part of the code by selecting lines and pressing
# CTRL+ENTER or click 'Run' in the editor window. If you do not select anything, R will run the line
# your cursor is on.

2 + 2


# -----------------------------------------------------------------------------
#                Packages
# -----------------------------------------------------------------------------


#R can do many different types of statistical and data analyses. They are organized in so-called packages or libraries.
# With the standard installation, most common packages are installed.

#There are many more packages available on the R website. If you want to install and use a package
# (for example, the package called 'geometry') you should first install the package by clicking
# 'install packages' in the packages window and typing geometry or by typing
# install.packages("geometry") in the command window.

install.packages('languageR')

#After installing a package, you need to load it:

library(languageR)


# -----------------------------------------------------------------------------
#                R as a calculator
# -----------------------------------------------------------------------------

# R can be used as a calculator. You can just type your equation in the command window after the >.
# Type 10 ^ 2 + 36.


# Compute the difference between 10 and 5 and divide this by
# the difference 3 and 2.

# You can also give numbers a name. By doing so, they become so-called variables which can be used
# later. For example, you can type in the command window x <- 4 .

x <- 4

#You can see that x appeared in the workspace window in the top right corner, which means that R now
# remembers what x is.



#Some people prefer to use <- instead of =. They do the same thing. <- consists of two characters,
# namely < and -, and represents an arrow pointing at the object receiving the value of the
# expression.

x <- 4


#You can also ask R what x is. Just type x in the command window.

x

#You can also do calculations with x. Type x * 5 .

x * 5

# If you specify A again, it will forget what value it had before. You can also assign a new value to
# A using the old one. Type A <- A + 10 .


#Now you know how to store numbers in variables. We can also create vectors using c()
#A vector is a sequence of elements. We will create a numeric vector.
vector <- c(1, 2, 3, 4)


#We can ask R things about the vectors.
length(x) #calculate the length
class(x) #class of vector

mynums <- 10:1 # create ranges
mynums #run the two lines

# -----------------------------------------------------------------------------
#                Functions
# -----------------------------------------------------------------------------


#We can call functions on the vector. Functions have the form name(). Functions 'do' things to the vectors.

#Within the brackets you specify the arguments. Arguments give extra information to the function. 
sum(mynums) # sum
min(mynums) # smallest value (minimum)
max(mynums) # largest value (maximum)
range(mynums) # minimum and maximum together
range(mynums) # minimum and maximum together

diff(range(mynums)) # range: difference between min and max

#Compute the sum of 4, 5, 8 and 11 by first combining them into a vector and then using the function
# sum. Use the function c inside the function sum.


# The function rnorm, as another example, is a standard R function which creates random samples from
# a normal distribution. Type rnorm(10) and you will see 10 random numbers

# Entering the same command again produces 10 new random numbers. Instead of typing the same text
# again, you can also press the upward arrow key (uparrow) to access previous commands. Try this.


#Use the help function to see which values are used as default in the function by typing ?function.

?mean

# You can also store the output of the function in a variable. Type x <- rnorm(100).

#R can also make graphs. Type plot(x) for a very simple example.

# -----------------------------------------------------------------------------
#                Subsetting
# -----------------------------------------------------------------------------

#Subsetting vectors with square brackets

##Use square brackets to subset elements in the vector

mynums[1]	 # retrieve value at first position
mynums[2] # retrieve value at second position


#R also allows slicing, or taking more than one entry at a time. 
mynums[1:4]	 # retrieve first four values



x <- c(NA, 2, 3, 1) #Sometimes data is not available. This is different from not possible or null. R uses the
#value NA to indicate this

x[is.na(x)]# retrieve NA values

#Subsetting vectors by names

 x <- 1:3 #create a sequence
 names(x) <- c("one", "two", "three") # set the names
 x["one"]

 
 
 
 
 
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
 
 #Print a summary of the data frame
 
 summary(beginningReaders)
 
 #To subset columns we will use the $
 
 beginningReaders$Word
 
 beginningReaders$LogRT
 
 beginningReaders$Subject
 
 beginningReaders$Trial
 
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
 
 #Next, we will do a density plot
 
 d = density(beginningReaders$LogRT) #returns density data
 plot(d) #plot results
 
 
 #Next we'll do a scatter plot.
 #We'll want a scatter plot of LogRT as a function of OrthLength.
 
 #Type plot(LogRT~OrthLength, beginningReaders)
 
 #Note that boxplot, unlike hist, did NOT specify a title and axis labels for you automatically.
 
 #Let's call boxplot again to specify labels. (Use the up arrow to recover the previous command and save yourself some typing.) 
 #We'll add more arguments to the call to specify labels for the 2 axes. Set xlab equal to "Orthographic length" and ylab equal to "Log transformed Reaction Time". 
 
 #Type plot(LogRT~OrthLength, beginningReaders, xlab="Orthographic length", ylab="Log transformed reaction time")
 
 
 
 
 
 
 
 
 
 
 # -----------------------------------------------------------------------------
 #                Your turn
 # -----------------------------------------------------------------------------
 
 
 # Make a script called firstscript.R. Type in the script R-code that generates 100 random numbers and
 # plots them. Save the script in your working directory 
 
 
 
 
 
 
 ##References##
 # Adapted from: https://github.com/ClaudiaBrauer/A-very-short-introduction-to-R/tree/master/Self%20study%20modules
 
 
 

 
 
 #In this first exercise, you will work through the swirl modules. To do this, you will need to install the 
 #swirl package and upload the library.
 
 #Installing swirl
 
 
 install.packages("swirl")
 
 library(swirl)
 
 swirl::install_course("R Programming")
 
 #Type swirl to start
 
 #Do the courses 1,8,3,4,5,6. Copy all the answers that you type in this script.
 
 #Answers for module 1:
 
 
 
 #Answers for module 2:
 
 
 #Answers for module 3:
 
 
 #Answers for module 4:
 
 
 #Answers for module 5:
 
 
 #Answers for module 6:
