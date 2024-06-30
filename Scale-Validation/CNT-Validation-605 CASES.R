setwd("/Users/apple/Desktop/【投稿中】相关性研究")
#设置文件路径-文件所在文件夹的位置
install.packages("lavaan")
install.packages("semPlot")
install.packages("foreign")
library(foreign)
library(lavaan)
library(semPlot)
CNT <- read.spss("【CNT检验】605.sav", to.data.frame = TRUE)
#<-  is created from；to.data.frame = TRUE保持文件结构
CNTmodel <- "CNT =~ CNT1+CNT2+CNT3+CNT4+CNT5+CNT6+CNT7+CNT8+CNT9+CNT10+CNT11+CNT12+CNT13+CNT14
"
fitmod <- cfa(CNTmodel, data = CNT, std.lv = T)
summary(fitmod, fit.measures = TRUE, standardized=T)
semPaths(fitmod, what = "std", rotation = 2, esize = 0.5, edge.color = "black")