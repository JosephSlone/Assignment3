GetColID <- function(name) {

    switch(tolower(name),
           "heart attack" = 11,
           "heart failure" = 17,
           "pneumonia" = 23,
           0)
}

rankhospital <- function(state, outcome, num = "best") {


    ## Apparently "best" and "worst" as well as integers are valid.

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

    s <- subset(data, State == state, select=c(State, Hospital.Name, colID))

    names(s)[3] <- "Rate"  # Rename column to something easy
    suppressWarnings(s$Rate <- as.numeric(s$Rate))
    s <- s[complete.cases(s),]
    s <- s[order(s$Rate, s$Hospital.Name), ]

    if(num == "best") num <- -1
    if(num == "worst") num <- -2
    num <- as.numeric(num)

    hosp <- NA
    if (num == -1) {
        s <- head(s,1)
        hosp <- s[1, "Hospital.Name"]
    }
    if (num == -2) {
        s <- tail(s, 1)
        hosp <- s[1, "Hospital.Name"]
    }

    if((num <= nrow(s)) & (num  >= 1) ) {
        s <- s[num, ]
        hosp <- s[1, "Hospital.Name"]
    }


    ## Return hospital name in that state with the given rank
    ## 30-day death rate

    return(hosp)


}