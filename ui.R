

suppressWarnings(library(shiny))
suppressWarnings(attach(Orange))

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Predict tree's age with circumference"),
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("circumference", "circumference cm", min = 30, max = 220, value = 60, step = 5),
            submitButton("get the prediction")
        ),
        
        # print predictions
        mainPanel(
            p("The purpose of this Shiny app is to display prediction of tree's age by tree's circumference. The model shows the 
           lower and upper age bounds based on the circumference."),
            p("The slider represents the  circumference (from 30 to 220). By moving the slider
          the lower and upper bounds of the circumference are changed."),
            p("The algorithm employs simplielinear model of age vs. circumference",
              strong(span("age", style = "color:blue")), "data set available in the base installation of R."),
            p("The linear model is about", strong(span("95%", style="color:red")), "accurate."),
            p("Prediction for th  circumference selected:"),
            verbatimTextOutput("indpred"),
            p("Running predictions (5 cm incremenets) starting from 60 cm mark:"),
            verbatimTextOutput("pred")
        )
    )
))