#!/usr/bin/env Rscript

suppressPackageStartupMessages({
  library(sf)
  library(terra)
  library(dplyr)
  library(readr)
})

# Derive ADM2 population totals for Uruguay by aggregating the cached
# WorldPop 2020 1km population raster to the official ADM2 boundaries.

adm2_path <- "data/boundaries/ury_adm_2020_shp/ury_admbnda_adm2_2020.shp"
worldpop_path <- "data/worldpop/ury_ppp_2020_1km_Aggregated_UNadj.tif"
output_path <- "data/derived/ury_adm2_population_worldpop_2020.csv"

if (!file.exists(adm2_path)) {
  stop("ADM2 boundary file not found: ", adm2_path)
}

if (!file.exists(worldpop_path)) {
  stop(
    "WorldPop raster not found: ", worldpop_path, "\n",
    "Download it first from:\n",
    "https://data.worldpop.org/GIS/Population/Global_2000_2020_1km_UNadj/2020/URY/ury_ppp_2020_1km_Aggregated_UNadj.tif"
  )
}

dir.create(dirname(output_path), recursive = TRUE, showWarnings = FALSE)

# Read the ADM2 geometries and keep only the join key used in the chapters.
adm2 <- st_read(adm2_path, quiet = TRUE) |>
  st_make_valid() |>
  select(ADM2_PCODE)

# Load the population-count raster and align the vector data to its CRS.
pop_raster <- rast(worldpop_path)
adm2_vect <- vect(st_transform(adm2, crs(pop_raster)))

# Sum population within each ADM2 polygon using exact cell fractions.
population_extract <- terra::extract(
  pop_raster,
  adm2_vect,
  fun = sum,
  na.rm = TRUE,
  exact = TRUE
)

adm2_population <- adm2 |>
  st_drop_geometry() |>
  mutate(
    total_population = population_extract[, 2]
  )

write_csv(adm2_population, output_path)

cat("Wrote:", output_path, "\n")
cat("ADM2 areas:", nrow(adm2_population), "\n")
cat("Total population:", round(sum(adm2_population$total_population, na.rm = TRUE)), "\n")
