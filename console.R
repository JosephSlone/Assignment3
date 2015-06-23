# This is a scratch file where I keep code ideas that I am testing.
#
#  -- Joe
#


# Find minimum value of column 11 (in this case)
# and store it in the scalar "m"

m <- min(outcome[, 11], na.rm = TRUE)

# Get the data frame (subset) of outcome that has a col 11 (in this case) that
is equal to the scalr "m"

s <- subset(outcome, outcome[, 11] == m)

###
#  There are 3 columns of data to look at besides the name and state of the
#  hospitals.
#
#   UF Name             #   Name
#
#  "heart attack"       11
#  "heart failure"      17
#  "pneumonia"          23
#

# First a working example.

test1 <- function(type) {
    switch(type,
           mean = 1,
           median = 2,
           trimmed = 3)
}

# Now, let's test my function

colID <- function(name) {

    switch(tolower(name),
           "heart attack" = 11,
           "heart failure" = 17,
           "pneumonia" = 23,
           0)
}

# Function to trim white space from a string.

function(x) gsub("^[[:space:]]+|[[:space:]]+$", "", x)


# Rank by column?

data$Ranking <- ave( data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, data$State, FUN=rank)

o <- data[ with(data, order(State, Ranking)), ]

data <- read.csv(
    "rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
    colClasses="character",
    na.strings="Not Available"
)

