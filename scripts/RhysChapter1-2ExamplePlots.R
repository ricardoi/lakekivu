library(readr)
library(tibble)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(tidyr)
library(purrr)
#--------------------------------------------------------#
#This is using the Potato & Sweetpotato Survey Data 2015.csv#
LakeKivuDat<-read_csv("Potato and Sweetpotato survey data 2015.csv")
view(LakeKivuDat)
KivuTib<-as_tibble(LakeKivuDat)
KivuTibSel<-select(KivuTib,2,3,11,12,15, 18,19)
head(KivuTibSel)
#I've selected Country,District, Altitude, Age of field,...#
#...SPVDSevertiy, Neighboring fields, and intercrops...#

#----------------Looking at Some Plots--------------------#

#The class of SPVD is a char, so for evaluting ...# 
#...them as numbers, let's make them numeric by using:#
KivuTibSel$SPVDseverity=as.numeric(KivuTibSel$SPVDseverity)
#class(KivuTibSel$SPVDseverity)

myplot<-ggplot(KivuTibSel,aes(x=Altitude,y=SPVDseverity,
                             col=Intercrops))+
  geom_point()+
  theme_bw()
myplot

myplot+
  facet_wrap(~Country)

#It seems like intercrops as coloring doesn't show us much#
#So lets color by district in this next plot:#

myplot2<-ggplot(KivuTibSel,aes(x=Altitude,y=SPVDseverity,
                               col=District))+
  geom_point()+
  theme_bw()
myplot2+
  facet_wrap(~Country)

#Lets try one more...#

#The Age of Fields is also char, so let's make it numeric:#
KivuTibSel$AgeOfFieldMonths=as.numeric(KivuTibSel$AgeOfFieldMonths)
#This will remove 13 lines of data (NA and ".")#

myplot3<-ggplot(KivuTibSel,aes(x=Altitude,y=AgeOfFieldMonths,
                               col=SPVDseverity))+
  geom_point()+
  theme_bw()
myplot3+
  facet_wrap(~Country)+
  scale_color_gradientn(colours = rainbow(5))

#Look at the AgeofField...gross...what's wrong?...#
KivuTibSel$AgeOfFieldMonths=as.numeric(KivuTibSel$AgeOfFieldMonths)

