#!/usr/bin/env Rscript

run <- function() {
    # 1. Define the question sets
    soe_list <- list(
        soe_1 = c(
            "What is cerebral perfusion pressure?",
            "What is the blood-brain barrier?"),
        soe_2 = c(
            "What are the circumventricular organs and what is their function?",
            "What are the main functions of the hypothalamus?"),
        soe_3 = c(
            "Why does the anaesthetist have to consider the blood-brain barrier when choosing anaesthetic drugs?",
            "How can the body compensate for the increased ventilation and perfusion during physical activity?"),
        soe_4 = c(
            "What is the Bohr effect?",
            "What is the Haldane effect?")
    )
    
    cat("--- Starting Study Session ---\n")
    cat("Press [Enter] for the next question, or type 'q' to quit.\n")
    
    # 2. Outer loop: Restarts the whole sequence forever
    while(TRUE) {
        for (i in 1:length(soe_list)) {
            
            current_set <- soe_list[[i]]
            selected_q <- sample(current_set, size = 1)
            
            # Print which SOE we are in and the question
            cat("\n[SECTION", i, "]----------------------------")
            cat("\nQUESTION: ", selected_q, "\n")
            
            # 4. Wait for user input
            cat("\nNext? > ")
            usr_input <- readLines(file("stdin"), n = 1)
            
            # Check for quit command
            if (tolower(usr_input) == "q") {
                cat("\nExiting... Good luck with your exam \n")
                return() # Exits the entire function and script
            }
        }
        
        cat("\n*** Completed one full round of all SOEs! Restarting from SOE 1... ***\n")
    }
}

# Execute the function
run()