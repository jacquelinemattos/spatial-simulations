#Working with raster files#
#J. Mattos, 2024

#### Working with raster files ####

library(raster)
library(sp)
library(terra)

# Load a raster file
binary_raster <- raster("C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/Distribution_Maps/Shapes-NicheModelling/Plot_maxent_thresTSS_thin9_buffer196_binary.asc")

plot(binary_raster)

# Extract the Extent of the Raster
# The extent gives you the boundary box of the raster, which includes the minimum and maximum coordinates in both the x and y directions.

ext <- extent(binary_raster)

# To create coordinates just outside the raster's extent, you can slightly increase the extent values.

# Define a small offset (e.g., 1% of the width and height of the raster)
offset_x <- (ext@xmax - ext@xmin) * 0.01
offset_y <- (ext@ymax - ext@ymin) * 0.01

# Calculate the outer coordinates
outer_coords <- data.frame(
  x = c(ext@xmin - offset_x, ext@xmin - offset_x, ext@xmax + offset_x, ext@xmax + offset_x),
  y = c(ext@ymin - offset_y, ext@ymax + offset_y, ext@ymax + offset_y, ext@ymin - offset_y)
)


# Saving the coordinates to a file 
write.csv(outer_coords, "C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/outer_coordinates.csv", row.names = FALSE)










