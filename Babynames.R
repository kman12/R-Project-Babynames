boys_actual <- cso_get_data("VSA50")
boys_actual <- boys_actual %>% gather(Year,Total, all_of(colnames(boys_actual[-c(1,2)])))
boys_actual$Gender <- "M"
boys_Occ_data <- subset(boys_actual,boys_actual$Statistic=="Boys Names in Ireland with 3 or More Occurrences")
boys_Rank_data <- subset(boys_actual,boys_actual$Statistic=="Boys Names in Ireland with 3 or More Occurrences Rank")
boys_Rank_data <- boys_Rank_data %>% rename("Rank" = "Total")
boys_Occ_data <- boys_Occ_data[,-c(1)]
boys_Rank_data <- boys_Rank_data[,-c(1)]
boys_df <- inner_join(boys_Occ_data, boys_Rank_data, by=c("Names","Year")) 
boys_df <- boys_df[,-c(6)]
boys_df <- boys_df %>% rename("Gender" = "Gender.x")



girls_actual <- cso_get_data("VSA60")
girls_actual <- girls_actual %>% gather(Year,Total, all_of(colnames(girls_actual[-c(1,2)])))
girls_actual$Gender <- "F"
girls_Occ_data <- subset(girls_actual,girls_actual$Statistic=="Girls Names in Ireland with 3 or More Occurrences")
girls_Rank_data <- subset(girls_actual,girls_actual$Statistic=="Girls Names in Ireland with 3 or More Occurrences Rank")
girls_Rank_data <- girls_Rank_data %>% rename("Rank" = "Total")
girls_Occ_data <- girls_Occ_data[,-c(1)]
girls_Rank_data <- girls_Rank_data[,-c(1)]
girls_df <- inner_join(girls_Occ_data, girls_Rank_data, by=c("Names","Year")) 
girls_df <- girls_df[,-c(6)]
girls_df <- girls_df %>% rename("Gender" = "Gender.x")


babynames <-  rbind(boys_df,girls_df)
babynames <- babynames[,c('Year','Names','Gender','Total','Rank')]
babynames$Gender <- factor(babynames$Gender)


