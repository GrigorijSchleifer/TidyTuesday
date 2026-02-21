#!/usr/bin/env Rscript

run <- function() {
    # 1. Define the question sets
    soe_list <- list(
        # anatomy & physiology
        soe_1 = c(
            "Please draw and explain the oxyhemoglobin dissociation curve",
            "What are the effects of altitude on the body?",
            "What conditions shift this curve to the right and to the left?",
            "What’s the Bohr effect?",
            "What is oxygen flux?",
            "How is CaO2 estimated?",
            "What is critical DO2?",
            "What is the Pasteur point?",
            "What is oxygen extraction ratio?",
            "What are the different types of data?",
            "What are the different measures of central tendency?",
            "How does oxygen content in the blood change with altitude?",
            "How is 2,3-DPG produced and what does it do?",
            "What factors increase 2,3-DPG production?",
            "What is the alveolar gas equation?",
            "What assumptions are required for the alveolar gas equation?",
            "How does PaCO2 affect PAO2?",
            "What tells alveolar gas equation about the PiO2 and PAO2 relationship?",
            "How is the alveolar gas equation affected by altitude?",
            "PaO2 in an aircraft with a cabin pressure of 80kPa?",
            "How does the respiratory quotient change in COPD?",
            "What is shunt and what categories do you know?",
            "What effect does shunt have?",
            "What happens if you increase the FiO2?",
            "How is CaO2 estimated?",
            "What is spirometry?",
            "Please draw a normal vitalograph spirometry trace for a single exhaled breath",
            "Draw a spirometry trace of normal tidal volume breathing, and then a maximal inspiratory and expiratory breath",
            "What volumes cannot be measured using spirometry?",
            "What is compliance?",
            "What is hysteresis?",
            "Please draw the following Flow-Volume Curves",
            "What is Transfer factor?"
            ),
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