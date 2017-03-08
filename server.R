
library(shiny)
library(e1071)

data$Outcome = as.factor(data$Outcome)
fit <- naiveBayes(Outcome ~ ., data = data)

shinyServer(function(input, output) {
   
  output$text <- renderText({
    inp <- data.frame(data)[NULL,1:8]
    inp[1,] <- rbind(c(input$preg, input$gluc, input$bpres, input$sthick, input$insulin,
    input$bmi, input$dpf, input$age))
    prediction <- predict(fit, inp[,])
    if (prediction == 1) {result <- "Yes."
    } else {
      result <- "No."
    }
    result
  
  })
  
})
