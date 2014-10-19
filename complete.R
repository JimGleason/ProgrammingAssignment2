# R Programming Week 2 Homework
# Read files (format: dir/num.csv where num is 3 digits with leading zeros)
# Params:
#    directory (directory containing csv files)
#    ids (vector of ids indicating datasets)
# Return:
#    a data frame (id=data set, nobs = number of complete observations [i.e. no NAs in any column])

complete <- function (directory="specdata", id=1:332) {
    
    vec <- as.data.frame (character())
    
    for (i in id) {
        fname <- sprintf("%s/%03d.csv", directory, i)
        if (file.exists(fname)) {
            vec <- rbind (vec, read.csv(fname))
        } else {
            return (paste ("Invalid monitor ID # ", i))
        }
    }

    # Note that the ID column contains the ID for each row
    count <- tapply (complete.cases(vec), vec[["ID"]], sum)
    data.frame (id=dimnames(count)[[1]], count)
    
}
