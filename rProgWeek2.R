# R Programming Week 2

# Read the monitor files
readPollutionFilesIntoListOfDataframes <- function (dir, id) {
    # dir is the directory where the files are found
    # id is a vector with a list of the monitor files (filenames are monitor_number.csv e.g. 001.csv)
    # Use read.csv (it's a csv file and read.csv (header = TRUE))
    # Use and apply function to read multple files ()
    
    vec <- list()
    
    for (i in id) {
        vec [[length(vec) + 1]] <- read.csv(sprintf("%s/%03d.csv", dir, i))
    }
    vec
}

readPollutionFilesIntoSingleDataframe <- function (dir, id) {
    # dir is the directory where the files are found
    # id is a vector with a list of the monitor files (filenames are monitor_number.csv e.g. 001.csv)
    # Use read.csv (it's a csv file and read.csv (header = TRUE))
    # Use and apply function to read multple files ()
    
    vec <- as.data.frame(character())
    
    for (i in id) {
        vec <- rbind (vec, read.csv(sprintf("%s/%03d.csv", dir, i)))
    }
    vec
}



