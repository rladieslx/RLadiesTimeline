# Define Server Output

shinyServer(function(input, output,session) {
  observeEvent(input$add, {
    value <- input$event
    item <- UUIDgenerate(use.time = FALSE)
    date <- as.factor(input$date)
    addItem("timeline", list(id=item, content=value, start=date))
    new <- data.frame(id=item, content=value, start=date)
    new_tline <- rbind(events, new) 
    write.csv(new_tline, "RLadiesEvents1")
  })
  observeEvent(input$save, {
    new_tline <- input$timeline_data
    write.csv(new_tline, "RLadiesEvents1")
  })
  events <- read.csv("RLadiesEvents1", row.names=1)
  output$timeline <- renderTimevis({
    timevis(events, options = list(editable=TRUE, height="200px"))
  })
} )

