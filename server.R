library(shiny)
library(MASS)

mpgoutput <- function(cylinders = 6, weight = 3.0,
                      displacement = 160, horsepower = 110) {
        # Linear discriminant Analysis model
        data(mtcars)

	# Fit a linear model for mileage as a function of 4 variables
        lm.fit <- lm(mpg ~ cyl + disp + wt + hp, data = mtcars)
        outputmpg <- predict(lm.fit, newdata = data.frame(cyl = cylinders, 
                                                          disp = displacement,
							  wt = weight,
                                                          hp = horsepower),
							  interval = "prediction")
        rownames(outputmpg) <- "miles/gallon"
        colnames(outputmpg) <- c("Prediction", "Min", "Max")
        return(outputmpg)
}


shinyServer(
        function(input, output) {
                output$Pairs <- renderPlot({pairs(~ mpg + disp + wt + hp + cyl, mtcars)})
                output$cylinders <- renderPrint({input$cylinders})
                output$displacement <- renderPrint({input$displacement})
                output$weight <- renderPrint({input$weight})
                output$hp <- renderPrint({input$hp})
                output$mpgout <- renderPrint({mpgoutput(input$cylinders, input$weight, input$displacement,
                                                     input$hp)})
        }
)
