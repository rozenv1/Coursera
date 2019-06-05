## First download the data, such as from the Internet
# GETTING DATA FROM THE INTERNET - using download.file()
# imnportant parameters: url, destfile, method
# useful for downloading tab-delimited, csv, and other files; using data from Traffic cameras from the City of Baltimore
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv", method="curl") ## note curl is used because of https, and especially if you use a Mac
list.files("./data")
# [1] "cameras.csv"
dateDownloaded<-date() # use this date() to track the date you downloaded the data
dateDownloaded

## read.table(): this is main function for reading data into R
# note, reads the data into RAM - big data can cause problems; to avoid this, read the data into 'chunks'
# Parameters: file, header, sep, row.names, nrows
# file = 
# header =
# sep = what's the separation btwn elements
# row.names=
# nrows= # of rows

cameraData<-read.table("./data/cameras.csv", sep=",", header=TRUE)
head (cameraData)

# could also use read.csv()
cameraData<-read.csv("./data/cameras.csv")
head(cameraData)


