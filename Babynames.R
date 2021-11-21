library("csodata")
library(tidyr)
library("xlsx")
library(dplyr)
library(arsenal)
boys1 <- cso_get_data("VSA50")
boys1 <- data.frame(boys_actual) 
#Removing character "X" from column names(Ex : "X1969" to 1969)
colnames(boys1)<-gsub("X","",colnames(boys1))
colnames(boys1)
#Transforming multiple year columns into one column to perform aggregate functions
boys2 <- boys1 %>% gather(Year,Total, all_of(colnames(boys1[-c(1,2)])))
#Adding Gender column to dataset
boys2$Gender <- "M"
#Spliting boys2 data to Occurances and Rank data
boys_Occ_data <- subset(boys2,boys2$Statistic=="Boys Names in Ireland with 3 or More Occurrences")
boys_Rank_data <- subset(boys2,boys2$Statistic=="Boys Names in Ireland with 3 or More Occurrences Rank")
colnames(boys_Rank_data)
boys_Rank_data <- boys_Rank_data %>% rename("Rank" = "Total")
colnames(boys_Rank_data)
#Removing Statistics column from boys_Occ_data and boys_Rank_data dataset 
boys_Occ_data <- boys_Occ_data[,-c(1)]
boys_Rank_data <- boys_Rank_data[,-c(1)]
#Top babynames(boys) total for all the years
top_babynames_boys <- data.frame(boys_Occ_data %>% group_by(Year) %>% top_n(1, Total))
top_babynames_boys
#Top babynames(boys) ranks for each year 
colnames(boys_Rank_data)
top_babynames_rank <-boys_Rank_data %>% group_by(Year) %>% filter()
summarise(min = min(Rank,na.rm=TRUE))
#Join Total and Ranks datasets(For future incase we need merged data )
boys_Occ_Rank <- inner_join(boys_Occ_data, boys_Rank_data, by=c("Names","Year")) 
boys_Occ_Rank1 <- boys_Occ_Rank[,-c(6)]
colnames(boys_Occ_Rank1)



   











