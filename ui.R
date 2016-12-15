
# Load required libraries


library(shiny)
library(timevis)
library(uuid)


# Define UI

shinyUI(fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "rladiestimeline.css")
  ),
  titlePanel("R-Ladies Lisboa Timeline"),
  sidebarPanel(
    textInput("event", "Add event"),
    dateInput("date","Date:"),
    actionButton("add", "Add")
  ),
  mainPanel(
    timevisOutput("timeline"),
    actionButton("save", "Save"))
))





