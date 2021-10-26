#First time installing csodata takes about 2 minutes to run#
install.packages("csodata")

#using the csodata library
library("csodata")

#VSA50 DATABASE ~ Boys Names with 3 or More Occurrences
#Years: 1964-2020
#4920 Names
#------------------------------------------------------------------------------#
#METADATA - what is the data headings and contents
tb2 <- cso_get_meta("VSA50")
cso_disp_meta("VSA50")

#Retrieving the data#
tb11 <- cso_get_data("VSA50")
head(tb11,1) #get the first row of the data (who's name is Jack)

#Putting all boys names into a data frame#
boys_df <- data.frame(tb11) #change boys names into a data frame

head(boys_df[,3],10) #first 10 rows in 1964

boys <- boys_df[,c(2:59)]#take a subset where we ignore the column "statistic"
row1_sum <- sum(boys[1,c(2:58)],na.rm=TRUE)#maybe replace with rowSum

ncol(boys) #58 columns
nrow(boys) #4920 rows 
head(boys,15) #look at the first 15 names in the data frame 
#------------------------------------------------------------------------------#


#VSA10 DATABASE ~ The Rank of Boys Names
#Years: 1998-2019 
#360 Names
#------------------------------------------------------------------------------#
cso_disp_meta("VSA10")

#Retrieving the data#
rank_boys1 <- cso_get_data("VSA10")
head(rank_boys1,1) #get the first row

#Putting all boys ranks into a data frame#
boys_rank_df <- data.frame(rank_boys1) 

head(boys_rank_df[,3],10) #first 10 rows in 1998

rank_boys <- boys_rank_df[,c(2:24)]#Ignore the column "statistic"

head(rank_boys,15) #First 15 names
#------------------------------------------------------------------------------#


#VSA60 DATABASE ~ Girls Names With 3 or More Occurrences
#Years: 1964-2020
#4920 Names
#------------------------------------------------------------------------------#
cso_disp_meta("VSA60")

#Retrieving the data#
girls1 <- cso_get_data("VSA60")
head(girls1,1) #get the first row of the data (who's name is Sarah)

#Putting all girls names into a data frame#
girls_df <- data.frame(girls1) 

head(girls_df[,3],10) #first 10 rows in 1964

girls <- girls_df[,c(2:59)]#take a subset where we ignore the column "statistic"
girls_1964_sum <- sum(girls[1,c(2:58)],na.rm=TRUE)#maybe replace with rowSum

head(girls,15) #look at the first 15 names in the data frame 
#------------------------------------------------------------------------------#


#VSA10 DATABASE ~ The Rank of Girls Names
#Years: 1998-2019 
#404 Names
#------------------------------------------------------------------------------#
cso_disp_meta("VSA11")

#Retrieving the data#
rank_girls1 <- cso_get_data("VSA11")
head(rank_girls1,1) #get the first row

#Putting all girls ranks into a data frame#
girls_rank_df <- data.frame(rank_girls1) 

head(girls_rank_df[,3],10) #first 10 rows in 1998

rank_girls <- girls_rank_df[,c(2:24)]#Ignore the column "statistic"

head(rank_girls,15) #look at the first 15 names in the data frame 
#------------------------------------------------------------------------------#