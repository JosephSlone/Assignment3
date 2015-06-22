
# Find minimum value of column 11 (in this case)
# and store it in the scalar "m"

m <- min(outcome[, 11], na.rm = TRUE)

# Get the data frame (subset) of outcome that has a col 11 (in this case) that
is equal to the scalr "m"

s <- subset(outcome, outcome[, 11] == m)