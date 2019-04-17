#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)

# Define UI for application that produce a stimulation
ui <- fluidPage(
  
  # Application title
  titlePanel("Simulation for Investment"),
  
  # Sidebar with a slider input for different factors 
  fluidRow(
    column(4, sliderInput("initial",
                          "Initial Amount:",
                          min = 0,
                          max = 100000,
                          step = 500,
                          value = 1000,  
                          pre = "$")
    ),
    column(4, sliderInput("return",
                          "Return Rate (in %)",
                          min = 0,
                          max = 20,
                          step = 0.1,
                          value = 5)
    ),
    column(4, sliderInput("years",
                          "Years",
                          min = 0,
                          max = 50,
                          step = 1,
                          value = 20)
    )),
  
  fluidRow(
    column(4, sliderInput("contribution",
                          "Annual Contribution",
                          min = 0,
                          max = 50000,
                          step = 500,
                          value = 2000,
                          pre = "$")
    ),
    column(4, sliderInput("growth",
                          "Growth Rate (in %)",
                          min = 0,
                          max = 20,
                          step = 0.1,
                          value = 2)
    ),
    column(4, selectInput("facet",
                          "Facet?",
                          c("No", "Yes")
    ))
    
  ),
  
  mainPanel(
    h4("Timelines"),
    plotOutput("distPlot"),
    width = 14,
    height = 6,
    h4("Balances"),
    verbatimTextOutput("view")
  )
)

# Define server
server <- function(input, output) {
  
  modalities <- reactive({
    
    #1) Future Value Function
    
    #' @title Future Value
    #' @description A function that computes the future value of an investment, taking amount, rate, years as arguments
    #' @param amount initial invested amount(numeric)
    #' @param rate annual rate of return(numeric)
    #' @param years number of years(numeric)
    #' @return Computed future value of investment
    
    future_value <- function(amount,rate,years){
      FV <- amount*(1+rate)^years
      return(FV)
    }
    
    #2) Future Value of Annuity
    #' @title Annuity
    #' @description A function that computes the future value of annuity, taking contributed amount, annual rate of return and years as arguments.
    #' @param contrib contributed amount(numeric)
    #' @param rate annual rate of return(numeric)
    #' @param years number of years(numeric)
    #' @return Computed future value of annuity
    annuity <- function(contrib, rate, years){
      FVA <- contrib*(((1+rate)^years-1)/rate)
      return(FVA)
    }

    #3) Future Value of Growing Annuity
    #' @title future value of growing annuity
    #' @description A function that computes the future value of growing annuity, taking contributed amount, annual rate of return, annual growth rate and years as arguments.
    #' @param contrib contributed amount(numeric)
    #' @param rate annual rate of return(numeric)
    #' @param growth annual growth rate(numeric)
    #' @param years number of years(numeric)
    #' @return Computed future value of growing annuity
    growing_annuity <- function(contrib,rate,growth,years){
      FVGA <- contrib * (((1+rate)^years - (1+growth)^years)/(rate-growth))
      return(FVGA)
    }
    
    return <- input$return / 100
    growth <- input$growth / 100
    initial <- input$initial
    period <- input$years
    contribution <- input$contribution
    
    modalities <- c()
    modalities <- as.data.frame(modalities)
    
    for (i in 0:period){
      modalities[i+1, 1] <- i
      modalities[i+1, 2] <-  future_value(initial, return, i)
      modalities[i+1, 3] <- future_value(initial, return, i) + annuity(contribution, return, i)
      modalities[i+1, 4] <- future_value(initial, return, i) + growing_annuity(contribution, return, growth, i)
    }
    
    names(modalities) <- c("year", "no_contrib", "fixed_contrib", "growing_contrib")
    
    return(modalities)
  })
  
  p <- reactive({
    
    dat <- gather(modalities(), key='variable', value='values', -year)
    dat$variable <- factor(dat$variable, levels = c("no_contrib", "fixed_contrib", "growing_contrib"))
    
    if(input$facet == 'No'){
      p <- ggplot(dat, aes_string(x='year', y='values', color = 'variable')) + 
        geom_line(size = 0.8) + 
        geom_point(aes(colour = variable),size = 1) + 
        labs(x="year",y="value",title = "Three modes of investing")
    } else {
      p <- ggplot(dat, aes(x=year, y=values, fill = variable)) + 
        geom_line(aes(colour = variable),size = 0.8) + 
        geom_point(aes(colour = variable), size = 1) + 
        geom_area(alpha = 0.5) + 
        labs(x="year",y="value",title = "Three modes of investing") + 
        facet_grid(.~ variable) + 
        theme_bw()
    }
    return(p)
  })
  
  output$distPlot <- renderPlot({
    p()
  })
  
  output$view <- renderPrint({
    head(modalities(),11)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
