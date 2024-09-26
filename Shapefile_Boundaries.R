#### Working with shape files ####

install.packages("sf")
library(sf)

# Load shapefiles
convex_hull <- st_read("C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/Distribution_Maps/Shapes-Poligonos-MCPs-DistributionRange/Efulgens_convex_hull.shp")

minimum_boundary <- st_read("C:/Users/JacquelineMattos/Documents/Docs_Jac/Doutorado/Analyses/DispersalSimulations/FEEMS/convex_hull/Efulgens_convexhull_MinimumBoundary.shp")

plot(minimum_boundary)

#Convex Hull: If the shape is complex and you want to extract coordinates that encompass the entire shape more tightly than a bounding box, you can compute the convex hull.

# Compute the convex hull of the shape
hull <- st_convex_hull(minimum_boundary)
plot(hull)


#Extract the vertices of the convex hull - This function will give you the coordinates of the polygon’s outline.
hull_coords <- st_coordinates(hull)
plot(hull_coords)


#### Densify the convex hull ####
#If you want more than just the vertices of the convex hull (i.e., points along the edges), you can "densify" the polygon by adding more points along its boundary. You can use the st_segmentize() function to add evenly spaced points


# Add additional points along the convex hull's edges (e.g., every 1 km)
convex_hull_densified <- st_segmentize(hull, dfMaxLength = 1000)  # 1000 meters
densified_coords <- st_coordinates(convex_hull_densified)

plot(densified_coords)

# Save coordinates to a CSV file
write.csv(densified_coords, "distribution_convexhull_polygon.csv", row.names = FALSE)
