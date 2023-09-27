#Descriptive Statistics - means and summary data
sapply(mtcars,mean)
mean(mtcars$mpg)
summary(mtcars)

#If you get a value for a mean that comes back as NA, you have missing data
#To remove missing data, include code similar to: na.rm=TRUE

missing_data <- data.frame(col1=c(1,2,NA),col2=c("hello","NA","world"))
mean(missing_data$col1)
mean(missing_data$col1,na.rm=TRUE)

#Correlations and Covariance - comparing variance of two or more random variables
cor(mtcars,use="complete.obs",method="pearson")
cov(mtcars,use="complete.obs",method="pearson")

#t-test - is there a difference between the means of two groups
t.test(mtcars$mpg,mtcars$cyl)

#linear regression - do certain variables (independent variables) influence 
#                     one specific variable (dependent variable)
sample_reg <- lm(mpg ~ cyl + wt + gear,data=mtcars)

#Summarize the regression
summary(sample_reg)

#ANOVA table
anova(sample_reg)
