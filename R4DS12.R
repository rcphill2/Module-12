#R4DS Example
install.packages("tidytext")
install.packages("wordcloud")
install.packages("textdata")
library(tidyverse)
library(stringr)
library(tidytext)
library(wordcloud)
library(textdata)
library(lubridate)


x <- c("apple", "banana", "pear")
str_view(x,"an")


dot <- "\\."
writeLines(dot)
str_view(c("abc", "a.c", "bef"),)


x <- "a\\b"
writeLines(x)
