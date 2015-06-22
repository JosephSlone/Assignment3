
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
           "hear attack" = 11,
           "heart failure" = 17,
           "pneumonia" = 23,
           0)
}

Function to trim white space from a string.

function(x) gsub("^[[:space:]]+|[[:space:]]+$", "", x)