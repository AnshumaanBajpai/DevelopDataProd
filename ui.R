library(shiny)
shinyUI(
        pageWithSidebar(
        # Application title
                headerPanel("Car Mileage prediction"),
                sidebarPanel(
                        numericInput('cylinders', '# of Cylinders', 6, min = 4, max = 8, step = 2),
                        numericInput('displacement', 'Engine displacement', 200, min = 70, max = 470, step = 1),
                        numericInput('weight', 'Car Weight (lb/1000)', 3, min = 1.51, max = 5.50, step = 0.01),
                        numericInput('hp', 'Horsepower', 125, min= 50, max = 350, step = 1),
                        submitButton("Submit")
                ),
                mainPanel(
                        h3("The variation of mileage versus relevant variables for the training dataset "mtcars" from base R package is presented here"),
                        plotOutput('Pairs'),
                        h2("Results of prediction"),
                        h4("The no. of cylinders, displacement, weigth and horsepower entered by you are "),
                        verbatimTextOutput("cylinders"),
                        verbatimTextOutput("displacement"),
                        verbatimTextOutput("weight"),
                        verbatimTextOutput("hp"),
                        h4("respectively."),
                        h4("These input values are predicted to have following mileage and 95% confidence interval"),
                        verbatimTextOutput("mpgout")
                )
        )
)
