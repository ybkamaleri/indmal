
setwd("~/Git-work/indmal/data")

## Load data
data01 <- read.csv("indikator01.csv", sep = ",", header = TRUE)
data02 <- read.csv("indikator02.csv", sep = ",", header = TRUE)
data03 <- read.csv("indikator03.csv", sep = ",", header = TRUE)

data01$n1 <- 30
data01$n2 <- 60
data01$n3 <- 70

data02$n1 <- 45
data02$n2 <- 75
data02$n3 <- 95

data03$n1 <- 60
data03$n2 <- 100
data03$n3 <- 105


data01$ind <- 1
data02$ind <- 2
data03$ind <- 3

dataset <- list(data01, data02, data03) #do.call require a list

dataall <- do.call(rbind, dataset) #combine all the data.frames

dataall <- readRDS("dataall.RDS")



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




dataall[with(dataall, sykehus %in% valgsyk, year %in% yearfilter),]





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

valgdata <- function(data, aar = NULL, sykehus = NULL, region = NULL, ind = NULL){

    "%i%" <- intersect
    data <- data

    yearall <- unique(data$year)
    sykall <- unique(data$sykehus)
    regall <- unique(data$region)
    indall <- unique(data$ind)

    indfil <- if (is.null(ind)) {which(data$ind %in% indall)
           } else {indfil <- which(data$ind %in% ind)}

    yearfil <- if (is.null(aar)) {which(data$year %in% yearall)
               } else {yearfil <- which(data$year %in% aar)}

    sykfil <- if (is.null(sykehus)) {which(data$sykehus %in% sykall)
              } else {sykfil <- which(data$sykehus %in% sykehus)}

    regfil <- if (is.null(region)) {which(data$region %in% regall)
              } else {regfil <- which(data$region %in% region)}


    dataFil <- yearfil %i% sykfil %i% regfil %i% indfil

    data[dataFil,]
}


valgdata(data = dataall, sykehus = c("Oslo", "Drammen", "Tromsø", "Nasjonal"), aar = 2015)
