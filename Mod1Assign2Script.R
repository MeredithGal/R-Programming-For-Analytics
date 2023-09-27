# Name Tabitha Hagen
# Module 1: Assignment 2

#-------------------------------------------------------------------------------
#== Question 1 Simple Vector Assignment
#-------------------------------------------------------------------------------

#   1) Create an object called student_num & assign it the values 1 through 75. 
       student_num <- c(1:75)
#   2) Write the code to display the contents of student_num 
       student_num

#-------------------------------------------------------------------------------
#== Question 2 Loading Packages and Plotting Data
#   You should have installed the tidyverse in the discussion/HW for this module.  
#-------------------------------------------------------------------------------

#   1) Write the code to load the tidyverse package. 
       library(tidyverse)
#   2) Create an object called sales. 
       sales <- c(50, 150, 200, 100, 300, 250)
#   3) Add the following values to sales (in this order): 50, 150, 200, 100, 
#      300, 250 
       sales <- c(50, 150, 200, 100, 300, 250)
#   4) Create another object called month. 
       month <- c(1, 2, 3, 4, 5, 6)
#   5) Add the following values to month (in this order): 1,2,3,4,5,6 
       month <- c(1, 2, 3, 4, 5, 6)
#   6) Use the qplot function to create a scatterplot with sales on the y-axis 
#      and month on the x-axis. 
       qplot(month, sales)
#   7) Add the following comment to your script and answer the question on the 
#      same line: 
#-------------------------------------------------------------------------------
#           What month had the largest sales? What was the amount?  
#               Month 5 had the most with 300 in sales
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#== Question 3 Working with Vectors and Data Types
#-------------------------------------------------------------------------------

# 1) Create a vector called months and add the months of the year (e.g., Jan, 
#    Feb, Mar, etc.). 
       months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", 
                   "Sep", "Oct", "Nov", "Dec")
# 2) Add the following comment to your script and answer the question on the 
#    same line: 

#-------------------------------------------------------------------------------
# What type of vector is this (hint: use typeof() or look in environment pane)?
          typeof(months)
          [1] "character"   
          or chr in the Global Environment Pane
#-------------------------------------------------------------------------------

# 3) Create a vector called days and add the days of the week (Mon.-Sat.) except
#    for Sunday where you should enter the number 7. 
     days<- c("Mon.", "Tue.", "Wed.", "Thu.", "Fri.", "Sat.", "7")
# 4) Add the following comments to your script and answer the question on the 
#    same line: 
#-------------------------------------------------------------------------------
#    How is the number 7 treated in the vector (as a double or character)? 
#    Why?  It is treated as a character because all data types in the vector
#    must be the same type.  The initial item in teh vector is of character type.
#-------------------------------------------------------------------------------

#  5) Write the following code:     Days <- c(1:7) 
      Days <- c(1:7) 
#  6) Add the following comments to your script and answer the question on the 
#     same line: 
#-------------------------------------------------------------------------------
#   Do Days and days contain the same values? NO
#   If they are different, what data type is Days and days? Days is of Double
#   Type (Numbers 1-7) and days is of character type.  (R is case Sensitive.)
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#== Question 4 Data Frames
#-------------------------------------------------------------------------------

# 7) Create a new data frame called Yearly_Sales. This data frame will contain 
#    two vectors with name for the first vector being month and the second 
#    vector being sales. For month, type out the abbreviation for the 12 months 
#    of the year (e..g, Jan). For sales, add the following values: 150.25, 
#    258.54, 268.55, 122.52, 987, 458.82, 667.23, 845.54, 586.78, 888.58, 
#    756.12, 456.84. 
          month <- months
          sales <- c(150.25, 258.54, 268.55, 122.52, 987, 458.82, 667.23, 
                     845.54, 586.78, 888.58, 756.12, 456.84)
          Yearly_Sales <- data.frame (month, sales)
#  8) Add the following comments to your script and answer the question on the 
#     same line 
#-------------------------------------------------------------------------------
#   Open data frame from the environment pane. 
#          (I clicked View as Grid in the Global Environment and then the table 
#           icon on the far right of Yearly_Sales to open the table or use 
#           View(Yearly_Sales) at the prompt)
#   Which month had the most sales? May
#   Which month had the least sales? April
#-------------------------------------------------------------------------------

#  9) Finally, add the code to the script that would create a qplot with month 
#     on the x-axis and sales on the y-axis (hint: to select a column of data 
#     you use the $ sign as in yearly_sales$sales). 
          qplot(month, sales)
# 10) The last step is to upload the file named Mod1Assign2Script.R into Canvas. 
#     If you do not have a file that ends in .R, you have probably typed into 
#     the Console area and not the Script area. Email me and I can help you in 
#     correcting this problem. 