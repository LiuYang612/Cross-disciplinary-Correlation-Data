setwd("/Users/apple/Desktop/ING相关性研究/")
#设置文件路径-文件所在文件夹的位置
install.packages("lavaan")
install.packages("semPlot")
install.packages("foreign")
library(foreign)
library(lavaan)
library(semPlot)
LIT <- read.spss("【LIT检验】605.sav", to.data.frame = TRUE)
#<-  is created from；to.data.frame = TRUE保持文件结构
LITmodel <- "FACTOR1 =~ LIT8+LIT10+LIT11+LIT12+LIT13+LIT14
FACTOR2 =~ LIT15+LIT16+LIT17+LIT19+LIT20
FACTOR3 =~ LIT2+LIT3+LIT4+LIT5+LIT6
LIT =~ FACTOR1+FACTOR2+FACTOR3"
fitmod <- cfa(LITmodel, data = LIT, std.lv = T)
summary(fitmod, fit.measures = TRUE, standardized=T)
semPaths(fitmod, what = "std", rotation = 2, esize = 0.5, edge.color = "black")