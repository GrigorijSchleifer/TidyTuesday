# Timely and Effective Care by US State ------------------

# tuesdata <- tidytuesdayR::tt_load('2025-04-08')
# ## OR
# tuesdata <- tidytuesdayR::tt_load(2025, week = 14)
# care_state <- tuesdata$care_state

# Option 2: Read directly from GitHub
care_state <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-04-08/care_state.csv')
