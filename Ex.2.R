library(tidyr)
library(dplyr)
library(readr)

#read csv file in RStudio
rawcsv <-read_csv("~/Downloads/titanic_original.csv")
#put the file into  table
titanic_tl <- tbl_df(rawcsv)
#correct missing value
titanic_tl$embarked[titanic_tl$embarked==""]<- "S"
#replace missing values with row mean
titanic_tl$age[is.na(titanic_tl$age)] <- mean(titanic_tl$age,na.rm=TRUE)
#relace missing values in "boat" with "none"
titanic_tl$boat <- sub("^$","None",titanic_tl$boat)
#create some dummy variables based on whether has a cabin number
finished <-mutate(titanic_tl,has_cabin_number = ifelse(grepl("^$",cabin),0,1))
View(finished)

#how to push