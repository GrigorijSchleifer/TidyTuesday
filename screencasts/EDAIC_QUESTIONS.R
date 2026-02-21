#!/usr/bin/env Rscript

run <- function() {
    soe_1 <- c(
        "What is cerebral perfusion pressure?",
        "What is the blood-brain barrier?")
    soe_2 <- c(
        "What are the circumventricular organs and what is their function?",
        "What are the main functions of the hypothalamus?")
    soe_3 <- c(
        "Why does the anaesthetist have to consider the blood-brain barrier when choosing anaesthetic drugs?",
        "How can the body compensate for the increased ventilation and perfusion during physical activity?")
    soe_4 <- c(
        "What is the Bohr effect?",
        "What is the Haldane effect?")
    
    soe_vector <- list(soe_1, soe_2, soe_3, soe_4)
    
    for (i in 1:length(soe_vector)) {
        current_set <- soe_vector[[i]]
        repeat_question <- TRUE
        
        while(repeat_question) {
            cat("\nQUESTION: ", sample(current_set, size = 1), "\n")
            cat("\n[Press Enter for another question, or type '1' to exit]: ")
            
            usr_input <- readLines(file("stdin"), n = 1)
            
            # 3. Check if we should stop
            if (usr_input == "1") {
                repeat_question <- FALSE
            }
        }
        
    }
}

# Execute the function
run()