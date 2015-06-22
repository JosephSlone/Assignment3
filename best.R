
GetColID <- function(name) {

    switch(tolower(name),
           "heart attack" = 11,
           "heart failure" = 17,
           "pneumonia" = 23,
           0)
}

best <- function(state, outcome) {
    ## Read outcome data

    data <- read.csv(
        "rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
        colClasses="character"
    )

    ## Check that state and outcome are valid
    valid.states = unique(data$State)
    if (!(state %in% valid.states)) {
        stop("invalid state")
    }

    colID <- GetColID(outcome)
    if (colID == 0)
        stop("invalid outcome")

    # convert only the column of interest to numeric
    suppressWarnings(data[, colID] <- as.numeric(data[, colID]))

    ## Return hospital name in that state with lowest 30-day death
    ## rate

    theState <- subset(data, data$State == state)
    min.outcome <- min(theState[, colID], na.rm = TRUE)
    states <- subset(theState, theState[, colID] == min.outcome)
    sorted.states <- states[order(states$Hospital.Name),]

    return(sorted.states[1:1,]$Hospital.Name)
}