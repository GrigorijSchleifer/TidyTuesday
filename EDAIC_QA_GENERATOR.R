#!/usr/bin/env Rscript --vanilla

# Your R code goes here

# To handle command line arguments:
args <- commandArgs(trailingOnly = TRUE)

if (length(args) > 0) {
    cat("Argument received:", args[1], "\n")
}

run <- function() {
    print("The script is running successfully!")    
}

run()


