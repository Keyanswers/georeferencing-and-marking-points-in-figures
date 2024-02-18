# Load required packages
e = c("raster","rasterVis","viridis",
      "latticeExtra")
lapply(e,require,character.only = TRUE)

# Load raster image
IMA = raster("C:/GoC.png")

# Plot raster image using levelplot function from rasterVis package
levelplot(IMA,col.regions = mako(50),
          margin = FALSE)

# Stretch raster image
IMA2 = stretch(IMA)

# Set extent of raster image
extent(IMA2) = c(-120, -100, 10, 35)

# Set projection of raster image
pro = "+proj=longlat +datum=WGS84"
projection(IMA2) = crs(pro) 

# Plot stretched raster image using levelplot function from rasterVis package
levelplot(IMA2, col.regions = mako(50),
          margin = FALSE)

# Save stretched raster image as a GeoTIFF file
writeRaster(IMA2,"C:/users/jucar/GoC.tif",
            format = "GTiff",
            overwrite = TRUE)

# Load stretched raster image
AS = raster("C:/users/jucar/GoC.tif")
AS

# Create X11 graphics device for plotting
x11()

# Plot stretched raster image
plot(AS, asp = 1)

# Use locator function to get coordinates of a point
QQ = locator(type = "p")
QQ

# Plot stretched raster image using levelplot function from rasterVis package
levelplot(AS, col.regions = mako(50),
          margin = FALSE)