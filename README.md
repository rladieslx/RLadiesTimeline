# RLadiesTimeline
An interactive timeline with timevis package and shiny.

WARNING:Make sure that all your files are in the same folder!

## Base Timeline File
events <- data.frame(
  id      = 1:4,
  content = c("Reunião Prof Telmo Nunes", "Evento Meetup",
              "Preparar Evento", "Evento Lançamento"),
  start   = c("2016-11-03", "2016-11-12",
              "2016-11-01", "2016-12-06 18:00:00")
)
write.csv(events, "RLadiesEvents")
read.csv("RLadiesEvents", row.names = 1)

## Shiny UI
This Shiny App uses CSS comands to some of the layouts

```{r}
library(shiny)
library(timevis)
library(uuid)

shinyUI(fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "rladiestimeline.css")
  ),
  titlePanel("R-Ladies Lisbon TimeLine"),
  sidebarPanel(
    textInput("event", "Add event"),
    dateInput("date","Date:"),
    actionButton("add", "Add")
  ),
  mainPanel(
    timevisOutput("timeline"),
    actionButton("save", "Save"))
))
```

## Shiny Server
```{r}
library(shiny)
library(timevis)
library(uuid)

shinyServer(function(input, output,session) {
  observeEvent(input$add, {
   value <- input$event
   item <- UUIDgenerate(use.time = FALSE)
   date <- as.factor(input$date)
   addItem("timeline", list(id=item, content=value, start=date))
   new <- data.frame(id=item, content=value, start=date)
   new_tline <- rbind(events, new) 
   write.csv(new_tline, "RLadiesEvents")
  })
  observeEvent(input$save, {
    new_tline <- input$timeline_data
    write.csv(new_tline, "RLadiesEvents")
  })
  events <- read.csv("RLadiesEvents", row.names=1)
  output$timeline <- renderTimevis({
    timevis(events, options = list(editable=TRUE, height="200px"))
  })
} )
```
## .CSS Document
Make sure that this document is inside a folder named "www" in the directory of your shiny app

```{r}
#Text boxes in the timeline
.vis-item {
    position: absolute;
    color: #1A1A1A;
    border-color: #0066cc;
    border-width: 2px;
    background-color: #FFFFFF;
    display: inline-block;
}

#Well Panel
.well {
    background-color: #cce5ff;
}

#Current time line
.vis-current-time{
  background-color: #004c99;
}

#Action Buttons
.btn-default {
    color: #333;
    background-color: #ff9933;
    border-color: #ccc;
}
```
