library("csodata")
library(tidyr)
library("xlsx")
boys_actual <- cso_get_data("VSA50")
boys_actual <- data.frame(boys_actual) 
#Removing character "X" from column names(Ex : "X1969" to 1969)
colnames(boys_actual)<-gsub("X","",colnames(boys_actual))
#Spliting Occurances boys data
boys_actual <- subset(boys_actual,boys_actual$Statistic=="Boys Names in Ireland with 3 or More Occurrences")
#Transforming multiple year columns into one column to perform aggregate functions
boys_df <- boys_actual %>% gather(Year,Total, all_of(colnames(boys_actual[-c(1,2)])))
#Removing Statistics column from dataset
boys_df <- boys_df[,-c(1)]
#Adding Gender column to dataset
boys_df$Gender <- "M"
#Top babynames(boys) for all the years
top_babynames_boys <- data.frame(boys_df %>% group_by(Year) %>% top_n(1, Total))









