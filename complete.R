# R Programming Week 2 Homework
# Read files (format: dir/num.csv where num is 3 digits with leading zeros)
# NOTE: Using rbind to create a single data.frame doesn't preserve the order of the
#       ids when counting complete frames.
# Params:
#    directory (directory containing csv files)
#    ids (vector of ids indicating datasets)
# Return:
#    a data frame (id=data set, nobs = number of complete observations [i.e. no NAs in any column])

complete <- function (directory="specdata", id=1:332) {
    
    vec <- list()
    
    # Read the files as a list of data.frames
    for (i in id) {
        vec [[length(vec) + 1]] <- read.csv(sprintf("%s/%03d.csv", directory, i))
    }
    
    
    # Note that the ID column contains the ID for each row
    count <- sapply (vec, function (x) {sum(complete.cases(x))})
    data.frame (id=id, nobs=count)
    
}
