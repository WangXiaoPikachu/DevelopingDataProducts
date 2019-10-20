
library(shiny)
attach(Orange)

fit.lm <- lm(age ~ circumference)

shinyServer(function(input, output) {
    
    output$indpred <- renderPrint({
        
        # build data frame
        newdata <- data.frame( circumference=input$circumference)
        
       
        g1 <- predict(fit.lm, newdata, interval="predict")
        
        # print individual prediction
        g1
    })
    
    output$pred <- renderPrint ({
        
       
        rng <- seq(from=30, to=input$circumference, by=c(5))
        
     
        newdata <- data.frame(circumference=rng)
        
        
        g <- predict(fit.lm, newdata, interval="predict")
        
       
        g
        
    })
    
})
