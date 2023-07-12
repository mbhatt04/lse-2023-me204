library(tidyverse)
install.packages(tidyverse)
df <- read_csv("Dec_lsoa_grocery.csv")
view(df)

### FILTER ###
a = df[df["area_id"] == "E01004735",]
view(a)

#Filtering to find these columns 
colnames(df)
cols <- c("area_id",
          "fat", "saturate", "salt", "protein", "sugar", "protein", 
          "carb", "fibre", "alcohol","population", "male",
          "female","age_0_17", "age_18_64", "age_65+", "avg_age","area_sq_km", "people_per_sq_km")
view(cols)

###Arranging code to find top 3 areas codes with highest alcohol content###
alcHigh <- arrange(df["area_id"],desc(df["alcohol"]))
slice(alcHigh,1:3)

###Arranging code to find 3 areas codes with lowest alcohol content###
alcLow <- arrange(df["area_id"],(df["alcohol"]))
slice(alcLow,1:3)

###Find top 3 areas codes with highest sugar content###
sugarHigh <- arrange(df["area_id"],desc(df["sugar"]))
slice(sugarHigh,1:3)

###Find 3 areas codes with lowest sugar content###
sugarLow <- arrange(df["area_id"],(df["sugar"]))
slice(sugarLow,1:3)

#Finding average and SD of population in one dataframe 
avgAndSD <- summarise(df, avg = mean(population, na.rm = TRUE), stdev = sd(population, na.rm = TRUE))

#Plotting a scatterplot
plot(df$"carb",df$"sugar") 

library(ggplot)


