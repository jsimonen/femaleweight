# An app that estimates the weight of a woman given her height. Based on linear regression of
# the R built-in dataset "women".

# This is the server side script that does the calculation. Also requires ui.R

library(shiny) # load the shiny library
womenlm=lm(weight ~ height, women) # generate the linear model for the data
fitline <- womenlm$coeff[1]+womenlm$coeff[2]*c(58,72)

# the shiny server function
shinyServer(function(input, output) {

  # prepare the input value for printing
  output$inputValue <- renderPrint({input$height})

  # predict the weight - reactive so it auto-updates when the user moves the slider
  pred_weight <- reactive({
    womenlm$coeff[1]+womenlm$coeff[2]*input$height
  })

  # plot the weight of the woman on the linear regression line
  output$weightPlot <- renderPlot({
    plot(c(58,72),fitline,type="l",xlab="Height [inches]",ylab="Weight [pounds]")
    points(input$height,pred_weight(),col="red")
  })
    
  # prepare the predicted weight for printing
  output$text1 <- renderPrint({as.numeric(round(pred_weight()))
  })
})