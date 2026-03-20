library(ggplot2)
library(ggthemes)
library(viridis)
library(grid)

# Course plotting and mapping defaults

# Load font when available, but keep a safe fallback for offline use.
course_font_family <- "sans"

if (requireNamespace("showtext", quietly = TRUE)) {
  sysfonts::font_add_google("Roboto Condensed", "robotocondensed")
  showtext::showtext_auto()
  course_font_family <- "robotocondensed"
}

# Shared text defaults used across plots and maps
course_text_theme <- function() {
  theme(
    text = element_text(family = course_font_family),
    plot.title = element_text(size = 18, face = "bold"),
    plot.subtitle = element_text(size = 13, margin = margin(b = 10)),
    plot.caption = element_text(size = 10, colour = "grey30"),
    plot.title.position = "plot",
    plot.caption.position = "plot",
    legend.title = element_text(size = 11, face = "bold"),
    legend.text = element_text(size = 10)
  )
}

# Theme for maps used across the course
theme_map_course <- function(...) {
  theme_tufte(...) +
    course_text_theme() +
    theme(
      axis.text.x = element_blank(),
      axis.text.y = element_blank(),
      axis.ticks = element_blank(),
      axis.title = element_blank(),
      panel.grid = element_blank(),
      legend.position = "right",
      legend.key.height = unit(0.45, "cm")
    )
}

# Theme for standard plots used across the course
theme_plot_course <- function(...) {
  theme_tufte(...) +
    course_text_theme() +
    theme(
      axis.text.y = element_text(size = 12),
      axis.text.x = element_text(size = 12),
      axis.title = element_text(size = 14),
      panel.grid.major.y = element_line(colour = "grey85", linewidth = 0.2),
      panel.grid.minor = element_blank()
    )
}

# Sequential palette: use viridis for ordered, non-centred data
scale_fill_course_seq <- function(...) {
  scale_fill_viridis_d(...) # fallback for discrete sequential fills
}

scale_colour_course_seq <- function(...) {
  scale_colour_viridis_d(...)
}

scale_fill_course_seq_c <- function(...) {
  scale_fill_viridis_c(...)
}

scale_colour_course_seq_c <- function(...) {
  scale_colour_viridis_c(...)
}

# Diverging palette: use RdBu and centre the series on 0
scale_fill_course_div <- function(..., midpoint = 0) {
  scale_fill_distiller(
    ...,
    palette = "RdBu",
    direction = -1,
    type = "div",
    limits = NULL,
    na.value = "grey85"
  )
}

scale_colour_course_div <- function(..., midpoint = 0) {
  scale_colour_distiller(
    ...,
    palette = "RdBu",
    direction = -1,
    type = "div",
    limits = NULL,
    na.value = "grey85"
  )
}

# Continuous diverging scales with explicit midpoint at 0
scale_fill_course_div_c <- function(..., midpoint = 0) {
  scale_fill_gradient2(
    ...,
    low = "#2166AC",
    mid = "#F7F7F7",
    high = "#B2182B",
    midpoint = midpoint,
    na.value = "grey85"
  )
}

scale_colour_course_div_c <- function(..., midpoint = 0) {
  scale_colour_gradient2(
    ...,
    low = "#2166AC",
    mid = "#F7F7F7",
    high = "#B2182B",
    midpoint = midpoint,
    na.value = "grey85"
  )
}

# Chapter-level sourcing often uses `try(source(...))`; this block keeps the
# shared file robust enough to stand in for those local fallbacks.
theme_loaded <- TRUE

# Backward-compatible aliases for older chapter code.
theme_map_tufte <- theme_map_course
theme_plot_tufte <- theme_plot_course
