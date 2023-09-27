#Name: Tabitha Hagen
# Module 2: Assignment 1
#---------------------------------------------------------------------------
#==Question 1 Importing an external dataset
# 1) Download the Marketing.csv file from Canvas which was originally captured from IBM 
   # who provides sample datasets for working with analytical software. Save this file 
   # as Marketing.csv in your project folder for Assignment1 (Module2 -> Assignment1 folder).

# 2) Import the Marketing.csv file into RStudio using readr which was discussed in the video. 
   # Be sure to include the import code in the script (i.e., copy the code from the import 
   # screen into the script).

#R Code for Question 1 goes here
   library(readr)
   Marketing <- read_csv("Marketing.csv")


# 3) Answer the following questions in your script.
  # How many variables does this dataset contain?
  It has 7 Columns/Variables.
  
  # What are the number of observations?
  It has 548 Rows/Observations.
  
# 4) Look at the console. Even though you were able to upload the file in RStudio without 
  # writing the actual code, R still needs to execute the code in the console. Answer 
  # the following question in your script.

  # What was the first line of code that had to be run to import the file?
  library(readr)was the 1st line, however, it only has to be called once.
  
  # Why did this line have to be run first before importing the file?
  This code only stores info in the Global Environment which clears out when closed.
  
#---------------------------------------------------------------------------

#==Question 2: Finding and Manipulating Data
# 1) In this module, you were introduced to retrieving data from an atomic vector. The same 
  # concepts work for retrieving data from a data frame. Instead of having just a single 
  # number to designated the column (from the lecture, example[4] returned the fourth entry 
  # (or column) in our vector), you will need to also designate the row:
  # Example[x,y] – where x is the row and y is the column

# 2) Within your script, write the code to display the value within the data frame for 
  # row 20 in the SalesinThousands column. Run this code in your script. 

#R Code for Question 2 goes here
  Marketing[20,"SalesInThousands"]
  # A tibble: 1 × 1
  SalesInThousands
  <dbl>
    1             23.4
  
# 3) Answer the following questions in your script.
  # What were the total sales in this row?
   In the Marketing.csv it states 23.35 but R rounded it up to 23.4.  
   It referenced it is a Tibble with a double data type.
   
# 4) Now, using a similar syntax, write the code in your script to change the value of 
  # the sales in row 20 to 123.45
   Marketing[20,"SalesInThousands"] <- 123.45
   > Marketing[20,"SalesInThousands"] 
   # A tibble: 1 × 1
   SalesInThousands
   <dbl>
     1             123.   #R rounded it again, but the chart shows the full number with decimals
   
# 5) Write the code within your script to doing the following comparisons:
  # a) Check to see if SalesinThousands for Location 1 - Week 4 (row 4) 
     # > SalesinThousands for Location 9 - Week 4 (row36). 
  # Run the code and in the script answer the following question
  # Were the sales at location 1 greater than location 9 for week 4?
    No location 9 was greater than location 4
     > Marketing[4,7] > Marketing[36,7]
          SalesInThousands
     [1,]            FALSE
     > Marketing[36,7] > Marketing[4,7]
          SalesInThousands
     [1,]            TRUE
          
  # b) Check to see if the AgeOfStores in row 389 and row 453 equal to each other. 
  # Run the code and in the script answer the following questions:
  # Are the ages of the stores in rows 389 and 453 equal? NO they are not.
     > Marketing[389,4] == Marketing[453, 4]
          AgeOfStore
     [1,]      FALSE

  # What would happen if we only use 1 equal sign in the comparison?
     It would use it as an assigment statement instead of an equation.
     
# 6) You can also search through your data frame to find specific values using the syntax below:
      # Data_frame_name[ which(Data_frame_name$ColumnName==’character_value’), ]
      # Marketing[ which(Marketing$MarketSize=='Medium'),]
  # In the above example, this would return all the rows in the Marketing data frame 
  # that contain a value of Medium in the MarketSize column. Notice that we are using 
  # a character to search (i.e., Medium) but numbers can also be used 
  # (e.g., Marketing$MarketID==1).

# 7) Write the code in your script to search in the Marketing data frame and display all 
  # stores that have an age of 22 (Note: this csv file has 4 weeks of data for each store).
     > Marketing[ which(Marketing$AgeOfStore=='22'),]
     # A tibble: 12 × 7
     MarketID MarketSize LocationID AgeOfStore Promotion  week SalesInThousands
     <dbl>      <chr>           <dbl>      <dbl>     <dbl> <dbl>            <dbl>
     1        2 Small             101         22         1     1             67.5
     2        2 Small             101         22         1     2             65.6
     3        2 Small             101         22         1     3             68.4
     4        2 Small             101         22         1     4             60.9
     5        2 Small             103         22         3     1             62.9
     6        2 Small             103         22         3     2             58.8
     7        2 Small             103         22         3     3             70.6
     8        2 Small             103         22         3     4             65.1
     9        8 Medium            705         22         3     1             49.7
     10       8 Medium            705         22         3     2             50.0
     11       8 Medium            705         22         3     3             49.5
     12       8 Medium            705         22         3     4             47.4     
     
  # What would happen if we only use 1 equal sign in the comparison?
    It would cgive Error: unexpected '=' in "Marketing[ which(Marketing$AgeOfStore="
    
# 8) Run the code and answer the following question in script:
  # How many stores in the data are 22 years old? 
    Three stores are age 22: 101, 103, and 705.
    
# 9) Upload the Mod2Assign1Script.R file into Canvas
#---------------------------------------------------------------------------