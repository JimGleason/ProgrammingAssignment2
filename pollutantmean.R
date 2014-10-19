# R Programming Week 2 Homework
# Read files (format: dir/num.csv where num is 3 digits with leading zeros)
# Params:
#    directory (directory containing csv files)
#    pollutant (one of the columns in the data sets)
#    ids (vector of ids indicating datasets)
# Return:
#    The mean for pollutant across all data sets read.

pollutantmean <- function (directory, pollutant, id=1:332) {
    
    vec <- as.data.frame (character())
    
    for (i in id) {
        fname <- sprintf("%s/%03d.csv", directory, i)
        if (file.exists(fname)) {
            vec <- rbind (vec, read.csv(fname))
        } else {
            return (paste ("Invalid monitor ID # ", i))
        }
    }
    
    mean (vec[[pollutant]], na.rm=TRUE)
}