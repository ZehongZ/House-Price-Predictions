#Import dataset
myd=read.csv("train.csv",header = T)
#Overview of the dataset
str(myd)
#First 5 rows
head(myd)
#Summary of the dataset
summary(myd)
#Check the missing values
library(Amelia)
library(mlbench)
is.na(myd)
missmap(myd, col=c("black","grey"),legend=FALSE)
library(naniar)
gg_miss_upset(myd)
#Count missing values in total
table(is.na(myd))
#Count missing values by columns
sapply(myd, function(myd) sum(is.na(myd)))
#Count missing value by rows
rowSums(is.na(myd))
#Select the integer values
IntVal=myd[c("MSSubClass","LotFrontage","LotArea","OverallQual","OverallCond","YearBuilt","YearRemodAdd","MasVnrArea","BsmtFinSF1","BsmtFinSF2","BsmtUnfSF","TotalBsmtSF","X1stFlrSF","X2ndFlrSF","LowQualFinSF","GrLivArea","BsmtFullBath","BsmtHalfBath","FullBath","HalfBath","BedroomAbvGr","KitchenAbvGr","TotRmsAbvGrd","Fireplaces","GarageYrBlt","GarageCars","GarageArea","WoodDeckSF","OpenPorchSF","EnclosedPorch","X3SsnPorch","ScreenPorch","PoolArea","MiscVal","MoSold","YrSold","SalePrice")]
#Check the IntVal
str(IntVal)
#Dimension of the IntVal
dim(IntVal)
#Summary of the dataset
summary(IntVal)
#Check the missing values
missmap(IntVal, col=c("black","grey"), legend=FALSE)
gg_miss_upset(IntVal)
#Count the missing values
table(is.na(IntVal))
sapply(myd, function(IntVal) sum(is.na(IntVal)))
#Proportion of missing values, 6%
348/(348+53672)
#Explore the realtionships between variables
cor(IntVal$MSSubClass, IntVal)
cor(IntVal$LotFrontage, IntVal)#Too many vising values
cor(IntVal$LotArea, IntVal)
cor(IntVal$OverallQual, IntVal)#Strong correlation with sales prices 79%
cor(IntVal$OverallCond, IntVal)
cor(IntVal$YearBuilt, IntVal)
cor(IntVal$YearRemodAdd, IntVal)
cor(IntVal$MasVnrArea, IntVal)#NA
cor(IntVal$BsmtFinSF1, IntVal)
cor(IntVal$BsmtFinSF2, IntVal)
cor(IntVal$BsmtUnfSF, IntVal)
cor(IntVal$TotalBsmtSF, IntVal)#Stong correlation with Sale Price 61%
cor(IntVal$X1stFlrSF, IntVal)
cor(IntVal$X2ndFlrSF, IntVal)#Strong corrleation with TotalBsmtSF (81%)
cor(IntVal$LowQualFinSF, IntVal)
cor(IntVal$GrLivArea, IntVal)#Strong correlation with TotRmsAbvGrd(82.5%) and sale price (70.9&)
cor(IntVal$BsmtFullBath, IntVal)
cor(IntVal$BsmtHalfBath, IntVal)
cor(IntVal$FullBath, IntVal)
cor(IntVal$BedroomAbvGr, IntVal)
cor(IntVal$KitchenAbvGr, IntVal)
cor(IntVal$TotRmsAbvGrd, IntVal)#Strong corrleation with GrLivArea(82.6%)
cor(IntVal$Fireplaces, IntVal)
cor(IntVal$GarageYrBlt, IntVal)
cor(IntVal$GarageCars, IntVal)
cor(IntVal$GarageArea, IntVal)#Strong correlation with GarageCars(88.2%)
cor(IntVal$WoodDeckSF, IntVal)
cor(IntVal$OpenPorchSF, IntVal)
cor(IntVal$EnclosedPorch, IntVal)
cor(IntVal$X3SsnPorch, IntVal)
cor(IntVal$ScreenPorch, IntVal)
cor(IntVal$PoolArea, IntVal)
cor(IntVal$MiscVal, IntVal)
cor(IntVal$MoSold, IntVal)
cor(IntVal$YrSold, IntVal)
cor(IntVal$SalePrice, IntVal)
#Handle missing values, replace na with mean
mean(IntVal$LotFrontage)
table(is.na(IntVal$LotFrontage))
head(IntVal$LotFrontage)
str(IntVal$LotFrontage)
summary(IntVal$LotFrontage)
myd2=myd1
myd2$LotFrontage=replace(myd2$LotFrontage, is.na(myd2$LotFrontage),70.05)
mean(myd2$LotFrontage)
