Shiny App Assignment
========================================================
author: Anand Agrawal
date: 4th April 2020
autosize: true

Purpose
========================================================

This app helps visualize the impact of COVID19 virus.


This app shows an interactive and reactive bar plot for countries most affected.

Plot is based on Plotly.

Details
========================================================

App shows below details of COVID19 cases for few selected countries

- Confirmed
- Recovered
- Deaths

User have option, a drop down list, where user can choose between Recovered or Deaths total for these countries and plot will be updated accordingly.

Summary of Data
========================================================

Below you can see the summary of data used in creating the plot


```r
library(readr)
covid19 <- read_csv("covid19_4Apr.csv")
covid19 <- subset(covid19, Deaths>200)
summary(covid19)
```

```
       X1        Country_Region         Deaths        Confirmed     
 Min.   : 3.00   Length:15          Min.   :  246   Min.   :  6131  
 1st Qu.: 9.50   Class :character   1st Qu.:  508   1st Qu.: 16264  
 Median :16.00   Mode  :character   Median : 1490   Median : 38542  
 Mean   :15.13                      Mean   : 3707   Mean   : 61640  
 3rd Qu.:21.50                      3rd Qu.: 5066   3rd Qu.: 86372  
 Max.   :25.00                      Max.   :14681   Max.   :258212  
   Recovered      
 Min.   :    0.0  
 1st Qu.:  176.5  
 Median : 2872.0  
 Mean   :12783.5  
 3rd Qu.:18846.5  
 Max.   :75891.0  
```

Reference and Notes
========================================================

Data was taken from below github repo on 4th April 2020.
<https://github.com/CSSEGISandData/COVID-19>.

Data was processed as required for the app to work.

Plesae note that the data may not be accurate and is solely used to demonstrate the working shiny app.

