setwd("/Users/apple/Desktop/ING相关性研究")
#设置文件路径-文件所在文件夹的位置
install.packages("lavaan")
install.packages("semPlot")
install.packages("foreign")
library(foreign)
library(lavaan)
library(semPlot)
LIN <- read.spss("【LIN检验】605.sav", to.data.frame = TRUE)
#<-  is created from；to.data.frame = TRUE保持文件结构
LINmodel <- "FACTOR1 =~ LIN23+LIN24+LIN25+LIN26+LIN27
FACTOR2 =~ LIN12+LIN13+LIN14+LIN15+LIN16
FACTOR3 =~ LIN17+LIN18+LIN19+LIN20+LIN21+LIN22
FACTOR4 =~ LIN7+LIN8+LIN9+LIN10+LIN11
FACTOR5 =~ LIN1+LIN2+LIN3+LIN4+LIN5+LIN6
LITCUL =~ FACTOR1+FACTOR2+FACTOR3+FACTOR4+FACTOR5"
fitmod <- cfa(LINmodel, data = LIN, std.lv = T)
summary(fitmod, fit.measures = TRUE, standardized=T)
semPaths(fitmod, what = "std", rotation = 2, esize = 0.5, edge.color = "black")