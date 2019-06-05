getwd()
## sample response:
## [1] "C:/Users/Office/Documents"
setwd("../") ## RELATIVE PATH: this moves one level up on your directory OR
## setwd("./data") ## Another RELATIVE PATH; here you enter the lowest level directory you want to be at
## sample response:
## [1] "C:/Users/Office"
## setwd("/Users/.../..../") ## ABSOLUTE PATH

## CHECKING FOR AND CREATING DIRECTORIES
file.exists("directoryName")
dir.create("directoryName")

if(!file.exists("data")) {
        dir.create("data")
}
file.exists("data")
## [1] TRUE

## GETTING DATA FROM THE INTERNET - using download.file()
# imnportant parameters: url, destfile, method
# useful for downloading tab-delimited, csv, and other files; using data from Traffic cameras from the City of Baltimore
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./data/cameras.csv", method="curl") ## note curl is used because of https, and especially if you use a Mac
list.files("./data")
# [1] "cameras.csv"
dateDownloaded<-date() # use this date() to track the date you downloaded the data
dateDownloaded
