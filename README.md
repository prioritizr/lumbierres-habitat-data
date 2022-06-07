
<!--- README.md is generated from README.Rmd. Please edit that file -->

# Habitat classification data from Lumbierres *et al.* 2021

[![lifecycle](https://img.shields.io/badge/Lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![DOI](https://img.shields.io/badge/DOI-10.5281/zenodo.6622059-blue.svg)](https://doi.org/10.5281/zenodo.6622059)

This repository contains code to generate global habitat classification
data (based on Lumbierres *et al.* 2021). Specifically, source data are
downloaded from the [Zenodo Digital
Archive](https://doi.org/10.5281/zenodo.5146072), and then projected to
the World Behrmann coordinate reference system using (100 m resolution;
[ESRI:4326 coordinate reference system](https://epsg.io/54017)). A
processed version of the data can be downloaded from the [Zenodo Digital
Repository](https://doi.org/10.5281/zenodo.6622059). **All credit should
go to Lumbierres *et al.* (2021), please cite their work if you use this
dataset.**

<img src="figures/README-map-1.png" style="display: block; margin: auto;" />

## Metadata

The habitat classification data are stored in a raster (GeoTIFF) file.
The file name contains the version number of the original datasets
(i.e., per the digital object identifier). The latest version of the
file is `lumbierres-10-5281_zenodo-5146073.tif`.

The metadata for the `lumbierres-10-5281_zenodo-5146073.tif` raster file
is shown below.

    Driver: GTiff/GeoTIFF
    Files: lumbierres-10-5281_zenodo-5146073.tif
    Size is 347351, 132926
    Coordinate System is:
    PROJCRS["World_Behrmann",
        BASEGEOGCRS["WGS 84",
            DATUM["World Geodetic System 1984",
                ELLIPSOID["WGS 84",6378137,298.257223563,
                    LENGTHUNIT["metre",1]]],
            PRIMEM["Greenwich",0,
                ANGLEUNIT["degree",0.0174532925199433]],
            ID["EPSG",4326]],
        CONVERSION["Lambert Cylindrical Equal Area",
            METHOD["Lambert Cylindrical Equal Area",
                ID["EPSG",9835]],
            PARAMETER["Latitude of 1st standard parallel",30,
                ANGLEUNIT["degree",0.0174532925199433],
                ID["EPSG",8823]],
            PARAMETER["Longitude of natural origin",0,
                ANGLEUNIT["degree",0.0174532925199433],
                ID["EPSG",8802]],
            PARAMETER["False easting",0,
                LENGTHUNIT["metre",1],
                ID["EPSG",8806]],
            PARAMETER["False northing",0,
                LENGTHUNIT["metre",1],
                ID["EPSG",8807]]],
        CS[Cartesian,2],
            AXIS["easting",east,
                ORDER[1],
                LENGTHUNIT["metre",1,
                    ID["EPSG",9001]]],
            AXIS["northing",north,
                ORDER[2],
                LENGTHUNIT["metre",1,
                    ID["EPSG",9001]]]]
    Data axis to CRS axis mapping: 1,2
    Origin = (-17367531.000000000000000,7287077.000000000000000)
    Pixel Size = (100.000000000000000,-100.000000000000000)
    Metadata:
      AREA_OR_POINT=Area
      TIFFTAG_SOFTWARE=GRASS GIS 7.8.5 with GDAL 3.0.4
    Image Structure Metadata:
      COMPRESSION=DEFLATE
      INTERLEAVE=BAND
    Corner Coordinates:
    Upper Left  (-17367531.000, 7287077.000) (179d59'59.98"E, 83d 0'14.04"N)
    Lower Left  (-17367531.000,-6005523.000) (179d59'59.98"E, 55d 0' 0.03"S)
    Upper Right (17367569.000, 7287077.000) (179d59'58.56"W, 83d 0'14.04"N)
    Lower Right (17367569.000,-6005523.000) (179d59'58.56"W, 55d 0' 0.03"S)
    Center      (      19.000,  640777.000) (  0d 0' 0.71"E,  5d 1'44.75"N)
    Band 1 Block=256x256 Type=Byte, ColorInterp=Gray
      Description = habitat_CGLS
      NoData Value=0
      Metadata:
        COLOR_TABLE_RULES_COUNT=1
        COLOR_TABLE_RULE_RGB_0=0.000000e+00 1.200000e+02 255 255 255 150 123 0

## Usage

You can run the code to produce the dataset using the system command
`make clean all`. After processing has successfully completed, the code
will produce two raster (GeoTIFF) files in the `results` directory.

## Software requirements

Operating system

-   Ubuntu (21.10) (300 Gb disk space available)

Software

-   GNU make (version 4.1)
-   GDAL (version 3.2.2)
-   R (version 4.1.1)

System packages

-   `gdal-bin`
-   `libudunits2-dev`
-   `libgdal-dev`
-   `libgeos-dev`
-   `libproj-dev`
-   `libxml2-dev`
-   `libssl-dev`

## Citation

This dataset was derived from Lumbierres *et al.* (2021). If you use
this dataset, you should cite their work - they deserve all the credit!

> Lumbierres, M (2021). *Map of habitat classes (Level 1) from the IUCN
> Habitat.* Zenodo Digital Repository. Available at
> <https://doi.org/10.5281/zenodo.5146072>.

> Lumbierres M, Dahal PR, Di Marco M, Butchart SHM, Donald PF, and
> Rondinini C (2021) Translating habitat class to land cover to map area
> of habitat of terrestrial vertebrates. *Conservation Biology*, **In
> press**, <DOI:10.1111/cobi.13851>. Available at
> <https://doi.org/10.1111/cobi.13851>.
