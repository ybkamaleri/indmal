
setwd("~/Git-work/indmal/data")

## Load data
data01 <- read.csv("indikator01.csv", sep = ",", header = TRUE)
data02 <- read.csv("indikator02.csv", sep = ",", header = TRUE)
data03 <- read.csv("indikator03.csv", sep = ",", header = TRUE)

data01$ind <- 1
data02$ind <- 2
data03$ind <- 3

## Subsetting
library('dplyr')

valgsyk <- c("Oslo", "Drammen", "Tromsø", "Kirkenes")

datasyk01 <- data01[data01$sykehus %in% valgsyk,]
datasyk02 <- data01[valgsyk,]
datasyk03 <- data01[valgsyk,]

yearfilter <- 2015
yearfilter01 <- c(2015, 2016)

data01 %>%
    filter(year %in% yearfilter01, sykehus %in% valgsyk)

## Table
library('formattable')

formattable(data01, list(
                        antall = normalize_bar("#ccf", 0.9),
                        prosent = normalize_bar("#ccf", 0.3)))


formattable(data02, list(
                    area(col = c(antall, prosent)) ~ normalize_bar("#bcf", 0.4)))




data01[with(data01, sykehus %in% valgsyk, year %in% yearfilter),]





##--Shiny UI
selectInput("valgsyk", "Sykehus",
            names(data01), multiple = TRUE)...

##--Shiny server
dfsyk <- reactive({
    data01[with(data01, sykehus %in% valgsyk, year %in% yearfilter),]
    data01[with(data01, sykehus %in% valgsyk, year %in% yearfilter),]
})


data <- data.frame(data01)



## TEST
