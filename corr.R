# R Programming Week 2 Homework
# Read files (format: dir/num.csv where num is 3 digits with leading zeros)
# Read all the files in the directory for this case.
# Params:
#    directory (directory containing csv files)
# Return:
#    a vector of correlations.
#    Using the default method in cor.

corr <- function (directory="specdata", threshold=0) {
    
    vec <- list();
    
    # Read the files as a list of data.frames
    for (i in list.files (directory)) {
        temp <- read.csv (paste(directory, i, sep="/"))
        vec [[length(vec) + 1]] <- temp[complete.cases(temp),]
    }
    

    result = numeric()
    
    # Note that the ID column contains the ID for each row
    for (i in vec) {
        if (nrow (i) > threshold)
            result <- c(result, cor(i$nitrate, i$sulfate))
    }
    
    result
    
}



