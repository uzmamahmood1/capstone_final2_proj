#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(quantmod)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  headerPanel("Word predictive analytics application - A product by Uzma"),
  
  sidebarPanel(
    
    textInput("text", 
              label = h3("Enter text:"), 
              value = "I live in "),
    h6(em("Note: The application works as typeahead, so you don't need to push the OK button, prediction is made when you hit the 'space' key")),
    h6(em("Note: This application ignores numbers and special characters")),
    
    submitButton("OK")
    
  ),
  
  mainPanel(
    h4("Predicted next work from twitter dataset:"),
    verbatimTextOutput("twitter_next"),
    h4("Predicted next work from blogs dataset:"),
    verbatimTextOutput("blogs_next"),
    h4("Predicted next work from news dataset:"),
    verbatimTextOutput("news_next"),
    
    h6("All codes can be found in the Coursera 
       Capstone folder at:"),
    h6(a("https://github.com/uzmamahmood1/capstone_final2_proj")),
    
    tags$footer(tags$script(src="autosubmit.js"))
    
  )
  
))