# Rescaling geographical coordinates to (0,100)
# If your table is in a CSV file, uncomment the following line
library(readr)


# Function to rescale latitude and longitude
rescale_coordinates <- function(data) {
  # Rescale latitude (range -90 to 90)
  data$rescaled_latitude <- (data$latitude + 90) / 180 * 100
  
  # Rescale longitude (range -180 to 180)
  data$rescaled_longitude <- (data$longitude + 180) / 360 * 100
  
  return(data)
}

# Loading data from a CSV file
data <- read_csv("C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/coord_file.csv")

coords <- read.table("C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/coord_file.csv", sep = ";", header = TRUE, stringsAsFactors = FALSE)


# Rescale the coordinates
rescaled_data <- rescale_coordinates(coords)

# View the rescaled data
print(rescaled_data)

# If you want to save the rescaled data to a CSV file:
write_csv(rescaled_data, "C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/rescaled_coordinates.csv")

write.table(rescaled_data, "C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/rescaled_coordinates.txt")


#_________________________________________________________________________

#Chris's code

data_norm = rnorm(100)
r_min = min(data_norm)
r_max = max(data_norm)
t_min = 0
t_max = 100
rescaled = ((data_norm - r_min) / (r_max - r_min)) * (t_max-t_min) + t_min
hist(rescaled)


data_coords = read.csv("C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/coord_file.csv", sep = ";")

w = 100  # map width

habitat_min_lat = -31
habitat_max_lat = -20
habitat_min_long = -53
habitat_max_long = -42


max_dim = max(abs(habitat_max_lat-habitat_min_lat), abs(habitat_max_long-habitat_min_long))

rescaled_lat = ((data_coords$latitude - habitat_min_lat) / max_dim) * w
rescaled_long = ((data_coords$longitude - habitat_min_long) / max_dim) * w

rescaled_lat
rescaled_long

rescaled_df <- data.frame(longitude = rescaled_long, latitude = rescaled_lat)

write.table(rescaled_df, "C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/rescaled_coordinates.txt")

write_csv2(rescaled_df, "C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/rescaled_coordinates.csv")


plot(rescaled_long, rescaled_lat)




#_______________________________________________________#

#### Re-scaling grid file ####

data_norm = rnorm(100)
r_min = min(data_norm)
r_max = max(data_norm)
t_min = 0
t_max = 100
rescaled = ((data_norm - r_min) / (r_max - r_min)) * (t_max-t_min) + t_min
hist(rescaled)


data_grids = read.csv("C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/grids/grid_100_2.shp", sep = ";")

w = 100  # map width

habitat_min_lat = -31
habitat_max_lat = -20
habitat_min_long = -53
habitat_max_long = -42


max_dim = max(abs(habitat_max_lat-habitat_min_lat), abs(habitat_max_long-habitat_min_long))

rescaled_lat = ((data_grids$latitude - habitat_min_lat) / max_dim) * w
rescaled_long = ((data_grids$longitude - habitat_min_long) / max_dim) * w

rescaled_lat
rescaled_long

rescaled_df_grid <- data.frame(longitude = rescaled_long, latitude = rescaled_lat)

write.table(rescaled_df, "C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/rescaled_coordinates.txt")

write_csv2(rescaled_df, "C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/rescaled_coordinates.csv")


plot(rescaled_long, rescaled_lat)





