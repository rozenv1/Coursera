if(!file.exists("data")){dir.create("data")}
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
# download.file(fileUrl,destfile="./data/cameras.xlsx", method="curl") # note this link does not work; had to convert csv file from cameras.csv to Excel and saved it to same location.
download.file(fileUrl,destfile="./data/cameras.xlsx", mode="wb")
dateDownloaded<-date()
dateDownloaded

# Next you'll need a library which is useful to read excel files and that is the xlsx library. Here is a list of libraries:
# read.xlsx(), read.xlsx2() {xlsx package}
# install.packages("xlsx") -- not using this due to issue with Java; used openxlsx instead.
# packageVersion("xlsx") -- not using this due to issue with Java; used openxlsx instead. 
# library (xlsx) -- not using this due to issue with Java; used openxlsx instead.
install.packages("openxlsx")
packageVersion("openxlsx")
library (openxlsx)

# install.packages("readxl")
# packageVersion("readxl")
# library(readxl)

#cameraData <- read.xlsx ("./data/cameras.xlsx", sheetIndex=1, header=TRUE)
cameraData <- read.xlsx ("./data/cameras.xlsx", sheet=1, startRow=1) #IMPORTANT NOTE: Since using openxlsx package, this package uses different attributes than xlsx package for sheet vs sheetIndex = and startRow vs header=TRUE.
head(cameraData)

colIndex<-2:3
rowIndex<-1:4
cameraDataSubset<-read.xlsx("./data/cameras.xlsx", sheet=1, startRow=1, rows=rowIndex, cols=colIndex)
cameraDataSubset
# cameraDataSubset<-read.xlsx("./data/cameras.xlsx", sheetIndex=1, colIndex=colIndex, rowIndex=rowIndex) # not using this due to issue with Java; used openxlsx instead and so attributes are different.
# cameraDataSubset # not using this due to issue with Java; used openxlsx instead and so attributes are different.
