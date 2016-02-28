# An app that estimates the weight of a woman given her height. Based on linear regression of
# the R built-in dataset "women".

# This is the user interface. Also requires server.R

library(shiny)

# Define UI for the application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Average weight for women"),
  
  # Sidebar with a slider input for the height of the user
  sidebarLayout(
    sidebarPanel(
      h4('This application will estimate you weight, given you height.'),
      h4('It assumes that your are of average weight.'),
      sliderInput("height","Your height in inches",
        min = 58, # these limits come from the data set
        max = 72, # we will not extrapolate, although we could
        value = 65) # default value
    ),
    
    # Print the results of the prediction, along with the plot
    mainPanel(
      h3('The results of the prediction'),
      h4('Your gave your height in inches as'),
      verbatimTextOutput("inputValue"),
      h4('Assuming you are of average weight, your predicted weight in pounds is'),
      verbatimTextOutput("text1"),
      plotOutput("weightPlot")
    )
  )
))