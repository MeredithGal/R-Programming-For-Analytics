# Ch 4 Case studey ER Injuries
# https://mastering-shiny.org/basic-case-study.html
# prototype of app at https://github.com/hadley/mastering-shiny/blob/master/neiss/narrative.R

library(shiny)
library(vroom)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(forcats)

# get the data on your own computer
dir.create("neiss")

# function defined to download from online
download <- function(name) {
  url <- "https://github.com/hadley/mastering-shiny/raw/master/neiss/"
  download.file(paste0(url, name), paste0("neiss/", name), quiet = TRUE)
}

# Grab the files we need 
download("injuries.tsv.gz")
download("population.tsv")
download("products.tsv")

   # The main dataset we’ll use is injuries, which contains around 250,000 observations & 10 variables
   injuries <- vroom::vroom("neiss/injuries.tsv.gz")
   # The data frame products lets us look up the product name from the product code
   products <- vroom::vroom("neiss/products.tsv")
   # The data frame population tells us the total US population in 2017 for each combination of age and sex
   population <- vroom::vroom("neiss/population.tsv")

#-------------------------------------------------------------------------------#
# Define UI for application that draws a histogram
   ui <- fluidPage(
     #first-row
     fluidRow(
       column(8,
              selectInput("code", "Product",
                          choices = setNames(products$prod_code, products$title),
                          width = "100%"
              )
       ),
       column(2, selectInput("y", "Y axis", c("rate", "count")))
     ),
     
     fluidRow(
       column(4, tableOutput("diag")),
       column(4, tableOutput("body_part")),
       column(4, tableOutput("location"))
     ),
     fluidRow(
       column(12, plotOutput("age_sex"))
     ),
     # narrative: tell a story at the bottom
     fluidRow(
       column(2, actionButton("story", "Tell me a story")),
       column(10, textOutput("narrative"))
     )
   )
   
   count_top <- function(df, var, n = 5) {
     df %>%
       mutate({{ var }} := fct_lump(fct_infreq({{ var }}), n = n)) %>%
       group_by({{ var }}) %>%
       summarise(n = as.integer(sum(weight)))
   }
   
#-------------------------------------------------------------------------------#
# The code for the server's output
server <- function(input, output, session) {
     selected <- reactive(injuries %>% filter(prod_code == input$code))
     
     # tables
     output$diag <- renderTable(count_top(selected(), diag), width = "100%")
     output$body_part <- renderTable(count_top(selected(), body_part), width = "100%")
     output$location <- renderTable(count_top(selected(), location), width = "100%")

     # we know that there are fewer older people than younger people, so the 
     # population available to be injured is smaller. Comparing the number of people 
     # injured with the total population allows us to calculating an injury rate per 10,000
     summary <- reactive({
       selected() %>%
         count(age, sex, wt = weight) %>%
         left_join(population, by = c("age", "sex")) %>%
         mutate(rate = n / population * 1e4)
     })
     
     # plot the line graph by age and sex
     output$age_sex <- renderPlot({
       if (input$y == "count") {
         summary() %>%
           ggplot(aes(age, n, colour = sex)) +
           geom_line() +
           labs(y = "Estimated number of injuries")
       } else {
         summary() %>%
           ggplot(aes(age, rate, colour = sex)) +
           geom_line(na.rm = TRUE) +
           labs(y = "Injuries per 10,000 people")
       }
     }, res = 96)
     
     # narrative-server output on the bottom
     narrative_sample <- eventReactive(
       list(input$story, selected()),
       selected() %>% pull(narrative) %>% sample(1)
     )
     output$narrative <- renderText(narrative_sample())
   }

#-------------------------------------------------------------------------------#
# Run the application 
shinyApp(ui = ui, server = server)
