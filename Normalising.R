library("csodata")
d <- read.csv("C:\\Users\\Henry\\Documents\\NUIM\\ST661-R\\Project\\babynames.csv")


#Get data and split count and rank
boys_Raw <- cso_get_data("VSA50")
boys_Count <- subset(boys_Raw,boys_Raw$Statistic=="Boys Names in Ireland with 3 or More Occurrences")
boys_Count <- boys_Count[,-1]
boys_Rank <- subset(boys_Raw,boys_Raw$Statistic=="Boys Names in Ireland with 3 or More Occurrences Rank")
boys_Rank <- boys_Rank[,-1]

girls_Raw <- cso_get_data("VSA60")
girls_Count <- subset(girls_Raw,girls_Raw$Statistic=="Girls Names in Ireland with 3 or More Occurrences")
girls_Count <- girls_Count[,-1]
girls_Rank <- subset(girls_Raw,girls_Raw$Statistic=="Girls Names in Ireland with 3 or More Occurrences Rank")
girls_Rank <- girls_Rank[,-1]

#Initialising some vectors for loops
years <- colnames(boys_Count[,-1])
totalsB <- c()
totalsG <- c()
variety <- c()

#Loop for sums and unique names
for (year in 1:length(years)){
  totalsB <- c(totalsB, sum(boys_Count[,year+1], na.rm = TRUE))
  totalsG <- c(totalsG, sum(girls_Count[,year+1], na.rm = TRUE))
  variety <- c(variety, max(boys_Rank[,year+1], na.rm = TRUE))
}

#Normalising count data as percentages
boys_Count[is.na(boys_Count)] <- 0
boys_Normalised <- boys_Count
boys_Normalised[,-1] <- boys_Count[,-1]/totalsB * 100
for (year in 1:length(years)){
  boys_Normalised[,year+1] <- boys_Count[,year+1]/totalsB[year] * 100
}

#Work on merged data
boyscsv <-subset(d, d$Gender == "M")
girlscsv <- subset(d, d$Gender == "F")

tboys <- data.frame(Year = years, All = totalsB)
tgirls <- data.frame(Year = years, All = totalsG)

j <- merge(boyscsv, tboys, by = "Year")
j$Percent <- j$Total/j$All * 100
j <- subset(j, select = -c(All))

k <- merge(girlscsv, tgirls, by = "Year")
k$Percent <- k$Total/k$All * 100
k <- subset(k, select = -c(All))

normalised <- rbind(j, k)

plot(years, variety, type = "b")
plot(years, boys_Count[1,-1], type = "b")
plot(years, boys_Normalised[1,-1], type = "b")
write.csv(normalised, "C:\\Users\\Henry\\Documents\\NUIM\\ST661-R\\Project\\normalised.csv")
