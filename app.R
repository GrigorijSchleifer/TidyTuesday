library(shiny)
library(lubridate)

# 1) Define the question sets (paste your full soe_list here)
soe_list <- list(
    anatomy = c(
        "Explain me the course of the corticospinal tract",
        "What is the thoracic inlet?"
    ),
    physics_physiology = c(
        "Tell me how oxygen is carried in blood.",
        "What is the structure of haemoglobin (Hb)?"
    )
    # ... add the other sections ...
)

ui <- fluidPage(
    titlePanel("SOE Question Trainer"),
    sidebarLayout(
        sidebarPanel(
            actionButton("next_btn", "Next question"),
            actionButton("quit", "Reset session"),
            hr(),
            checkboxInput("random_section", "Random section each time", FALSE),
            helpText("Click 'Next question' to advance.")
        ),
        mainPanel(
            h3(textOutput("days_left")),
            h4(textOutput("section")),
            tags$pre(textOutput("question"))
        )
    )
)

server <- function(input, output, session) {
    
    future_date <- ymd("2026-06-27")
    
    # State: current section index + current question text
    state <- reactiveValues(
        i = 1,
        section = names(soe_list)[1],
        question = ""
    )
    
    # Helper to compute days left
    days_left <- reactive({
        now <- today()
        as.integer(time_length(future_date - now, unit = "days"))
    })
    
    # Function that picks a new question based on current state
    pick_question <- function() {
        if (isTRUE(input$random_section)) {
            state$section <- sample(names(soe_list), 1)
            state$i <- match(state$section, names(soe_list))
        } else {
            state$section <- names(soe_list)[state$i]
        }
        
        current_set <- soe_list[[state$section]]
        state$question <- sample(current_set, 1)
    }
    
    # Initial question
    observeEvent(TRUE, {
        pick_question()
    }, once = TRUE)
    
    # Next button
    observeEvent(input$next_btn, {
        if (!isTRUE(input$random_section)) {
            state$i <- state$i + 1
            if (state$i > length(soe_list)) state$i <- 1
        }
        pick_question()
    })
    
    # Reset button
    observeEvent(input$quit, {
        state$i <- 1
        state$section <- names(soe_list)[1]
        pick_question()
    })
    
    # Outputs
    output$days_left <- renderText({
        paste0("Days left: ", days_left())
    })
    
    output$section <- renderText({
        paste0("Section: ", state$section)
    })
    
    output$question <- renderText({
        state$question
    })
}

shinyApp(ui, server)