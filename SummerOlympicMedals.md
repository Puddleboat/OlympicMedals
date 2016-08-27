
========================================================



Summer Olympic Medals 
==
Developing Data Products Course Project

A Shiny World Map


========================================================

---
title       : Summer Olympics World Map from 1896 - 2008
subtitle    : Developing Data Products Week 4 project
author      : Aaron Williams
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
logo        : logo.png
---



## Introduction

For the Coursera Developing Data Products course students are required to submit a course Project

As my course co-incided with the 2016 Summer Olympics in Rio de Janeiro, Brazil I decided that would be a good topic to work on. After a little web browsing I downloaded the data set from the following site:

https://www.theguardian.com/sport/datablog/2012/jun/25/olympic-medal-winner-list-data#data

Using skills I have learnt through this, and previous courses within the Data Science specialisation, I created an interactive world map in Shiny.



========================================================
## About the Data

From the downloaded xlsx I saved the "ALL MEDALISTS" and "IOC COUNTRY CODES" worksheets as separate CSV files, "medals.csv" and "isocodes.csv""

My inspection of the data found  1 error. Joyce Chepchumba was listed as winning bronze in the mens marathon rather than the womens. I corrected this manually in the data set before proceeding.

I have provided a preview of the data.




```
     City Edition      Sport  Discipline                  Athlete NOC
1   Paris    1900 Tug of War  Tug of War             AABYE, Edgar ZZX
2 Antwerp    1920   Aquatics    Swimming    AALTONEN, Arvo Ossian FIN
3 Antwerp    1920   Aquatics    Swimming    AALTONEN, Arvo Ossian FIN
4  London    1948 Gymnastics Artistic G. AALTONEN, Paavo Johannes FIN
5  London    1948 Gymnastics Artistic G. AALTONEN, Paavo Johannes FIN
  Gender                Event Event_gender  Medal
1    Men           tug of war            M   Gold
2    Men    200m breaststroke            M Bronze
3    Men    400m breaststroke            M Bronze
4    Men individual all-round            M Bronze
5    Men         pommel horse            M   Gold
```


========================================================

## The Shiny app

As I was intruiged by the flexibility and power of the GoogleVis package when presented in the course videos, I decided to plot medals by country on an interactive world map.

The slider allows the user to select the Olympic year to display on the map. Through the use GoogleVis gvisGeoChart, when users move the mouse over the map, it will display the medals each country won that year.

Due to World Wars, there were no Summer Olympics, and subsequently no data available for years 1916, 1940 and 1944. 

========================================================

## Conclusion

The app is available to test on the shinyapps site

 https://datasensenz.shinyapps.io/OlympicMedals/

The code for this project, additional readme file, and this slide presentation is available from my github

https://github.com/Puddleboat/OlympicMedals.git
