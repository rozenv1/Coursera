library(swirl)
install_from_swirl("Getting and Cleaning Data")
swirl()
## 1: Manipulating Data with dplyr
## In this lesson, you'll learn how to manipulate data using dplyr. dplyr 
## is a fast and powerful R package that provides a consistent and concise 
## grammar for manipulating tabular data.

## Using download log from July 8, 2014, from "CRAN" which contains information on 
## roughly 225,000 package downloads.

## I've created a variable called path2csv, which contains the full file
## path to the dataset. Call read.csv() with two arguments, path2csv and
## stringsAsFactors = FALSE, and save the result in a new variable called
## mydf. Check ?read.csv if you need help.

mydf<-read.csv(path2csv, stringsAsFactors=FALSE)
library(dplyr)
packageVersion("dplyr")

## The first step of working with data in dplyr is to load the data into what the package
## authors call a 'data frame tbl' or 'tbl_df'. To create a new tbl_df called cran:
cran<-tbl_df(mydf)

## To avoid confusion and keep things running smoothly, let's remove the original data frame 
## from your workspace with rm("mydf").
rm("mydf")

## From ?tbl_df, "The main advantage to using a tbl_df over a regular data frame is the printing."
## the output you get is much more informative and compact than what we would get if we 
## printed the original data frame (mydf) to the console.
cran

## According to the "Introduction to dplyr", its philosophy is to have small functions that each do one thing well.
## Specifically, dplyr supplies five 'verbs' that cover most fundamental data manipulation tasks: select(), filter(),
## arrange(), mutate(), and summarize().

## Per ?select: this Chooses or rename variables from a tbl. select() keeps only the variables you mention; 
## rename() keeps all variables. Usage: select(.data, ...), rename (.data, ...)
## Per ?mutate: this adds new variables and preserves existing ones through calculations applied.

## with larger datasets, we are only interested in some of the variables. Use select(cran, ip_id, package, country) to select only the ip_id, package, and country variables from the cran dataset.
## the select() function knows we are referring to column of the cran dataset.
select (cran, ip_id, package, country)

## use the : operator to select a sequence of columns by entering the following:
select(cran,r_arch:country)

## TO OMIT columns, use the negative sign in front of time which tells select() that we DON'T want the time column.
select(cran, -time)
# To OMIT columns from X to size:
select(cran,-(X:size))

## Use FILTER () function to select a subset of rows. To to select all rows for which the package variable is equal to "swirl":
# note that filter() recognizes 'package' as a column of cran, without you having to explicitly specify cran$package
filter(cran, package=="swirl")



