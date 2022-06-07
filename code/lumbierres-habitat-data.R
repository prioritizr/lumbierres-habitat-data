# Initialization
## load packages
library(aoh)
library(raster)
library(terra)
library(sf)
library(rappdirs)
library(gdalUtilities)

## set variables
### set number of threads
n_threads <- max(1, parallel::detectCores() - 2)

### change this to where you want to save the inputs
input_dir <- "inputs"

### change this to where you want to save the outputs
output_dir <- "results"

### set version to process
### note that latest_zenodo_version() fails for Zenodo archives that only have
## one version, so here we manually specify the first version if it fails
version <- try(
  aoh:::latest_zenodo_version(
    x = "10.5281/zenodo.5146072",
    file = "habitat_CGLS.tiff"
  ),
  silent = TRUE
)
if (inherits(version, "try-error")) {
 version <- "10.5281/zenodo.5146073"
}

# Preliminary processing
## print version
cli::cli_alert_info(paste0("Version: ", version))
cli::cli_alert_info(paste0("GDAL_CACHEMAX: ", Sys.getenv("GDAL_CACHEMAX")))

## download data
raw_path <- aoh:::get_zenodo_data(
  x = version,
  dir = input_dir,
  force = FALSE,
  file = "habitat_CGLS.tiff"
)

## construct output path
output_path <- gsub(
  ".", "-", gsub("/", "_", version, fixed = TRUE), fixed = TRUE
)
output_path <- file.path(tempdir(), paste0("lumbierres-", output_path, ".tif"))
output_path <- gsub("\\", "/", output_path, fixed = TRUE)

# Main processing
## import habitat data
raw_data <- terra::rast(raw_path)

## import elevation data
elev_data <- get_global_elevation_data(
  dir = rappdirs::user_data_dir("aoh"),
  version = "latest",
  force = FALSE,
  verbose = TRUE
)

## project habitat data to match elevation data
habitat_data <- aoh:::terra_gdal_project(
  x = raw_data,
  y = elev_data,
  filename = output_path,
  method = "near",
  n_threads = n_threads,
  datatype = "INT1U",
  cache_limit = 5000,
  tiled = TRUE,
  bigtiff = TRUE,
  compress = "DEFLATE",
  NAflag = 0,
  verbose = TRUE
)

## verification
habitat_data <- terra::rast(output_path)
assertthat::assert_that(
  terra::compareGeom(habitat_data, elev_data, res = TRUE, stopiffalse = FALSE),
  msg = "GDAL processing didn't work correctly"
)

# Finished
message("Done!")
