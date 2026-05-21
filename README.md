---
title: "Georeferencing Raster Images in R"
author: "Juan Carlos Rubio Polania, PhD"
date: "2024-02-18"
---

# Georeferencing Raster Images in R 🗺️📡🌍

## Overview

This workflow demonstrates how to load, manipulate, georeference, visualize, and export raster images in R.

The script combines:
- Raster visualization
- Color enhancement
- Raster stretching
- Spatial referencing
- Coordinate system assignment
- GeoTIFF export
- Interactive coordinate extraction

Although this example uses an image of the Gulf of California, the workflow can be adapted to many applications involving:
- Remote sensing
- Historical maps
- Satellite imagery
- Ecological studies
- GIS workflows
- Environmental sciences
- Spatial visualization

The workflow provides a simple introduction to raster processing and georeferencing in R.

---

# Required Packages

```r
e = c(
  "raster",
  "rasterVis",
  "viridis",
  "latticeExtra"
)

lapply(e, require,
       character.only = TRUE)
```

---

# Workflow

## 1. Load Required Libraries

```r
require(raster)
require(rasterVis)
require(viridis)
require(latticeExtra)
```

The script loads packages used for:
- Raster processing
- Spatial visualization
- Color palettes
- Advanced plotting

---

## 2. Load Raster Image

```r
IMA = raster("C:/GoC.png")
```

A raster image is loaded into R.

Although the example uses a PNG image, the workflow can be adapted to:
- TIFF
- JPEG
- GeoTIFF
- Satellite imagery
- Historical maps

---

## 3. Visualize Raster Data

```r
levelplot(IMA,
          col.regions = mako(50),
          margin = FALSE)
```

The raster is visualized using:
- `levelplot`
- Viridis color palettes
- RasterVis visualization tools

---

## 4. Stretch Raster Values

```r
IMA2 = stretch(IMA)
```

Raster stretching improves:
- Contrast
- Visualization
- Color distribution

This step can improve image interpretation and visual quality.

---

## 5. Define Spatial Extent

```r
extent(IMA2) = c(-120, -100, 10, 35)
```

The geographic extent of the raster is assigned manually.

The values represent:
- Minimum longitude
- Maximum longitude
- Minimum latitude
- Maximum latitude

---

## 6. Assign Coordinate Reference System (CRS)

```r
pro = "+proj=longlat +datum=WGS84"
projection(IMA2) = crs(pro)
```

The raster is assigned a geographic coordinate system using:
- Longitude/Latitude coordinates
- WGS84 datum

---

## 7. Export GeoTIFF File

```r
writeRaster(
  IMA2,
  "C:/users/jucar/GoC.tif",
  format = "GTiff",
  overwrite = TRUE
)
```

The georeferenced raster is exported as a GeoTIFF file.

GeoTIFF files preserve:
- Spatial coordinates
- Projection information
- Raster structure

---

## 8. Reload Georeferenced Raster

```r
AS = raster("C:/users/jucar/GoC.tif")
```

The exported raster is loaded again for verification and visualization.

---

## 9. Interactive Coordinate Extraction

```r
QQ = locator(type = "p")
```

The `locator()` function allows interactive extraction of coordinates directly from the plotted raster.

This can be useful for:
- Ground control points
- Spatial referencing
- Manual georeferencing
- Exploratory GIS analyses

---

## 10. Final Visualization

```r
levelplot(AS,
          col.regions = mako(50),
          margin = FALSE)
```

The final georeferenced raster is visualized again using RasterVis.

---

# Applications

This workflow can be useful for:
- GIS workflows
- Remote sensing
- Environmental sciences
- Ecological studies
- Historical cartography
- Spatial ecology
- Raster processing
- Georeferencing tasks

---

# Requirements

- R
- raster
- rasterVis
- viridis
- latticeExtra

---

# Notes

This workflow uses a manually assigned spatial extent and CRS.

For more accurate georeferencing, additional control points and spatial transformations may be required depending on the application.

---

# License

This project is licensed under the MIT License.

---

# Author

Juan Carlos Rubio Polania, PhD
