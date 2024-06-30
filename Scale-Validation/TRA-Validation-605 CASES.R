setwd("/Users/apple/Desktop/ING相关性研究/")
#设置文件路径-文件所在文件夹的位置
install.packages("lavaan")
install.packages("semPlot")
install.packages("foreign")
library(foreign)
library(lavaan)
library(semPlot)
TRA <- read.spss("【TRA检验】605.sav", to.data.frame = TRUE)
#<-  is created from；to.data.frame = TRUE保持文件结构
TRAmodel <- "FACTOR1 =~ TRA17+TRA18+TRA19+TRA20+TRA21
FACTOR2 =~ TRA4+TRA5+TRA6+TRA7+TRA8+TRA9+TRA10+TRA11+TRA14
TRA =~ FACTOR1+FACTOR2"
fitmod <- cfa(TRAmodel, data = TRA, std.lv = T)
summary(fitmod, fit.measures = TRUE, standardized=T)
semPaths(fitmod, what = "std", rotation = 2, esize = 0.5, edge.color = "black")