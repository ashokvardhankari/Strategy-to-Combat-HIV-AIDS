#install.packages("devtools")
require(devtools)
#install.packages('Rcpp')
require(Rcpp)
#install_github('ramnathv/rCharts', force = TRUE)
require(rCharts)
#install.packages("googleVis")
require(googleVis)
require(varhandle)

# Custom settings for the motion chart
myStateSettings <-'
{"xZoomedDataMin":1199145600000,"colorOption":"2",
"duration":{"timeUnit":"Y","multiplier":1},"yLambda":1,
"yAxisOption":"4","sizeOption":"_UNISIZE",
"iconKeySettings":[],"xLambda":1,"nonSelectedAlpha":0,
"xZoomedDataMax":1262304000000,"iconType":"LINE",
"dimensions":{"iconDimensions":["dim0"]},
"showTrails":false,"uniColorForNonSelected":false,
"xAxisOption":"_TIME","orderedByX":false,"playDuration":150000,
"xZoomedIn":false,"time":"2010","yZoomedDataMin":0,
"yZoomedIn":false,"orderedByY":false,"yZoomedDataMax":100}'

# Fox News
casesVsSpending <- read.csv("HIV_Cases_Vs_Spending.csv", header = TRUE)

head(casesVsSpending)
casesVsSpending$Year <- as.numeric(casesVsSpending$Year)
summary(casesVsSpending)
class(casesVsSpending$HIV_Cases)

#foxnews$Date <- as.Date(casesVsSpending$Date)
casesVsSpendingVis = gvisMotionChart(casesVsSpending, 
                          idvar="Country", 
                          timevar="Year",
                          options = list(width=1300, height=850))
plot(casesVsSpendingVis)

