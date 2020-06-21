#!/usr/bin/env Rscript
library(leaflet)
library(shinythemes)

# SHINY CODE ####

shinyUI(fluidPage(
  theme = shinytheme("sandstone"),
  

  sidebarLayout(
    sidebarPanel(
      h1("Electoral Cooperation in Japan: 1996-2017"),
      fluidRow(
        helpText('This app is built to examine electoral data in Japan, and model hypothetical alliances between political parties.')
        ),
      selectInput("year",
                  label = "Choose a year to display",
                  choices = c(1996,2000,2003,2005,2009,2012,2014,2017),
                  selected = 2005),
      sliderInput("eff",
                  "Alliance Efficiency",
                  min=0,max=1,value=0),
      fluidRow(
        helpText('Alliance Efficiency determines how many net votes flow from the weaker ally to the stronger in each district.  At zero (the default), no votes transfer.')
    ),
    fluidRow(
      column(4,
      checkboxGroupInput("a1", 
                  label = "Alliance 1 Parties:",
                  choices = "Liberal Democratic Party",
                  selected = "Liberal Democratic Party")),
      column(4,
      checkboxGroupInput("a2", 
                         label = "Alliance 2 Parties:",
                         choices = "Democratic Party of Japan",
                         selected = "Democratic Party of Japan")),
      column(4,
             checkboxGroupInput("a3", 
                                label = "Alliance 3 Parties:",
                                choices = "Japanese Communist Party",
                                selected = character(0)))
      ),
      helpText("Set up to three alliances.  By default, these are set to historical alliances for the given year.
               If no parties are provided for alliance-3, it defaults to the best candidate outside of the first two alliances."),
    fluidRow(
      actionButton("save","Save"),
      actionButton("map12","Change Alliance Focus"),
      actionButton("map13","Current / Saved / Saved - Current"),
      actionButton("map14","Seats / Votes")
    ),
    fluidRow(
      helpText("Use 'save' to store one instance for comparison.
        'Change Alliance Focus' shifts the map from alliance 1 to alliance 2.
                 'Current / Saved / Saved - Current' shifts the map from showing the current plot data, saved plot data, or comparing the two.
                 'Seats / Votes' shifts between focusing on seats vs votes")
    )
    ),
    mainPanel(
      fluidRow(
        column(6,
          plotOutput("ternaryPlot",height=600,width=600)),
        column(6,
          plotOutput("ternaryPlot.saved",height=600,width=600))
      )
      ,fluidRow(
       column(6,
              leafletOutput("map.plot",height=1200,width=1200))
      )
    )
  )
))

