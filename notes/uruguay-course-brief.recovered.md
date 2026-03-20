# Spatial Data Modelling for Uruguay: Project Brief

## Purpose

This repository will be adapted to support the **Spatial Data Modelling** workshop to be taught at **Universidad de la República, Uruguay**, from **23 to 27 March 2026**. The course will reuse the structure, code patterns, and most of the pedagogical material already present in this repository, but it will be refocused around **Uruguay-relevant examples and data**.

The goal is not to rewrite the full book. The goal is to produce a coherent teaching sequence for the workshop, covering the **combined welcome/preamble in `index.qmd`** and chapters **01** to **06**, using a consistent Uruguay storyline and open-access data wherever possible.

## Scope

### In scope

-   `preamble.qmd`
-   `01-embedding-space.qmd`
-   `02-spatial-data-wrangling.qmd`
-   `03-points.qmd`
-   `04-spatial-interaction-model.qmd`
-   `05-spatial-dependence.qmd`
-   `06-spatial-heterogeneity.qmd`
-   `data.qmd`

### Out of scope for this course adaptation

-   `07-multilevel-modelling.qmd`
-   `08-weighted-regression-modelling.qmd`
-   `09-spatio-temporal-wrangling.qmd`
-   `10-spatio-temporal-modelling.qmd`
-   `11-spatial-machine-learning.qmd`
-   `platform.qmd`

## Reuse Strategy

Most files in the repository can be reused. The main changes are expected in:

-   examples and data sources
-   chapter framing and learning objectives
-   explanatory text tied to non-Uruguay case studies
-   figures, maps, and code chunks that currently depend on legacy datasets

The adaptation should preserve the existing style of the book where possible:

-   Quarto chapter structure
-   R-first workflow
-   applied emphasis over formal derivation
-   progressive build-up from concepts to modelling

## Course Narrative

The adapted course should tell one consistent story:

1.  what makes spatial data different from non-spatial data
2.  how to work with spatial objects in R
3.  how point data can reveal spatial concentration and surfaces
4.  how flows connect places
5.  how nearby areas influence one another
6.  how relationships vary across space

Where possible, chapters **05** and **06** should use the same Uruguay dataset so students can move from spatial dependence to spatial heterogeneity without resetting context.

## Chapter Plan

## `preamble.qmd`

Current state: structure exists but needs development.

Planned role:

-   introduce the course aims, format, and assessment logic
-   explain how the workshop differs from a full textbook
-   clarify the applied orientation: concepts first, then implementation in R
-   set expectations on data, reproducibility, and notebook-based learning

Needed work:

-   develop the narrative under each existing heading
-   add a short section explaining the Uruguay-focused adaptation
-   include a simple roadmap of the chapters covered in the workshop
-   align wording with the MSc/PhD audience in social sciences

## `01-embedding-space.qmd`

Current state: content exists and is reusable, but needs refinement.

Planned role:

-   establish the conceptual foundations of spatial thinking
-   explain spatial data types, hierarchical geographies, and core problems such as MAUP, ecological fallacy, spatial dependence, and heterogeneity

Needed work:

-   tighten the prose and reduce any material that feels too book-like for a short workshop
-   add 1 or 2 Uruguay examples to anchor abstract concepts
-   make transitions clearer between data types, scale, and modelling implications
-   ensure chapter terminology matches later chapters

## `02-spatial-data-wrangling.qmd`

Current state: substantial content exists, but the chapter currently spends too much space on general R basics.

Planned role:

-   focus on what is specific about spatial data
-   introduce the main data structures students need for the rest of the course
-   provide a practical toolkit for reading, inspecting, transforming, projecting, joining, and mapping spatial data

Refocus priorities:

-   geometries: points, lines, polygons, rasters if mentioned briefly
-   coordinate reference systems and projections
-   attribute data versus geometry columns
-   simple features and `sf`
-   core spatial verbs: read, inspect, transform, join, aggregate, validate
-   thematic mapping with `ggplot2` and/or `tmap`

Needed work:

-   trim most generic R-introduction material unless it is essential for novice students
-   foreground `sf` workflows
-   use Uruguay boundaries and attributes as the running example
-   keep only the minimum needed introduction to tidy data manipulation

## `03-points.qmd`

Current state: chapter exists, but the data and surrounding text need replacement.

Planned role:

-   introduce point pattern thinking through a Uruguay case
-   cover density, binning, KDE, and interpolation in an intuitive way

Needed work:

-   replace the existing point dataset
-   propagate the new case study through all explanatory text, figures, and questions
-   keep the distinction clear between observed points and interpolated surfaces

Candidate open-access point datasets for Uruguay:

-   **Road traffic crashes or incidents** from Uruguay open-data portals if coordinates are available. This is likely strong for KDE and hotspot-style exploration.
-   **Health or education facilities** as georeferenced point locations. This is simpler and very teachable, though less suitable for interpolation unless paired with an attribute.
-   **Montevideo urban assets** such as trees, cultural facilities, or public services if a national dataset is not clean enough.

Preferred selection criteria:

-   openly downloadable
-   point geometry already available or easy to geocode
-   enough observations for density estimation
-   socially meaningful and easy to explain in class

Updated local note:

-   a stronger Uruguay-specific candidate has now been identified for chapter `03`: the Montevideo open-data dataset **Base anual de personas lesionadas en siniestros de tránsito**
-   the official metadata confirms location fields:
    -   `X`: longitude of the crash location
    -   `Y`: latitude of the crash location
-   the CSV has now been downloaded into the repository as `data/montevideo-traffic-injuries-2022.csv`
-   direct inspection shows that `X` and `Y` are stored in **projected coordinates**, using **EPSG:32721** rather than longitude/latitude
-   the repository still contains an Airbnb Buenos Aires extract in `data/airbnb-ba`, which remains available as a fallback or secondary example

Updated recommendation:

-   primary dataset for `03`: **Montevideo traffic injuries / road crash victims**
-   fallback dataset: `data/airbnb-ba`

## `04-spatial-interaction-model.qmd`

Current state: structure and modelling logic can likely be reused, but the case study should change.

Planned role:

-   teach origin-destination thinking with internal migration in Uruguay
-   move from visualising flows to modelling flows

Needed work:

-   replace the current OD dataset with **internal migration flows for Uruguay**
-   rebuild any centroids, distance matrices, and flow objects required by the chapter
-   adapt maps, flow visualisations, and narrative examples

Preferred data target:

-   origin-destination internal migration matrix between Uruguayan departments, municipalities, or another consistent administrative geography

Practical note:

-   this dataset may need to be **assembled from INE census tables** rather than downloaded as one ready-made matrix
-   if a sufficiently detailed migration matrix is not easily available, a fallback could be commuting or service-access flows, but migration remains the preferred storyline

## `05-spatial-dependence.qmd`

Current state: chapter logic exists, but the data should be replaced.

Planned role:

-   introduce non-spatial regression, spatial autocorrelation, spatial weights, and spatial regression using a Uruguay demographic outcome

Needed work:

-   identify a Uruguay polygon dataset with a meaningful demographic or social outcome
-   rebuild the regression example and neighbour structure
-   make the diagnosis of spatial dependence visually intuitive

Recommended open-access dataset:

-   a **Uruguay small-area demographic indicator dataset** linked to administrative polygons, ideally from census or official statistics

Preferred examples:

-   ageing, dependency ratio, education, overcrowding, female-headed households, or deprivation

Working recommendation:

-   use an official **census-based demographic indicator by area**, then derive spatial weights from the associated polygons

## `06-spatial-heterogeneity.qmd`

Current state: can be adapted from the same analytical structure as chapter 05.

Planned role:

-   continue the chapter 05 storyline
-   show that the relationship estimated in a global model may vary by place
-   introduce spatial fixed effects and spatial regimes in a way that is consistent with the workshop level

Needed work:

-   reuse the same dataset as `05-spatial-dependence.qmd`
-   keep variables aligned so students can compare the dependence and heterogeneity chapters directly
-   simplify any parts that assume too much econometric background

## `data.qmd`

Current state: describes legacy datasets.

Planned role:

-   become the data inventory for the Uruguay version of the course

Needed work:

-   remove or archive descriptions of datasets not used in the workshop
-   document each Uruguay dataset included in the adaptation
-   for each dataset, record:
    -   source
    -   geography
    -   spatial unit
    -   key variables
    -   projection / CRS
    -   pre-processing steps
    -   chapter(s) where it is used

## Proposed Data Strategy

### Core polygon geography

Start by defining one base Uruguay geography for repeated use across chapters, ideally:

-   departments if teaching simplicity is the main priority
-   municipalities or smaller census-based areas if more observations are needed for modelling

This decision affects chapters **02**, **05**, and **06**, and potentially the destination/origin geography for **04**.

### Chapter-specific data needs

-   `02`: administrative boundaries plus a small attribute table
-   `03`: point locations with enough observations for density analysis
-   `04`: origin-destination flow matrix plus origin and destination geometries
-   `05` and `06`: polygon data with demographic attributes and enough units for neighbourhood-based modelling

## Candidate Dataset Review

The following review assesses the specific candidate datasets currently available in the repository against the workshop chapter goals.

| Candidate | Current local state | Best fit | Strengths | Main limitations | Recommendation |
|------------|------------|------------|------------|------------|------------|
| `data/airbnb-ba` | Contains listings, calendar, reviews, neighbourhood CSVs, and `neighbourhoods.geojson` | `03` | Ready-made point observations with coordinates and housing attributes; also includes neighbourhood boundaries for context maps | Buenos Aires rather than Uruguay; weaker thematic alignment with the rest of the workshop | Usable now for `03`; replace later only if a better Uruguay point dataset is secured |
| `data/fb-social-connectedness` | Large region-pair shard(s), including `gadm2_shard_PY.csv` | Possible alternative for `04` | Region-to-region connectivity matrix; interesting for spatial networks | Not a true flow dataset; very large; current shard is not Uruguay-centred | Keep as backup, not first choice |
| `data/fb-activity-spaces` | One large CSV with Uruguay records present | `04`, possibly `05`/`06` after aggregation | Closest to origin-destination structure; has home/visit areas, coordinates, and daytime/nighttime split | Requires substantial preprocessing; behavioural rather than demographic | Strong candidate for `04` |
| `data/fb-movement-distribution` | One CSV with Uruguay ADM2 records | `05` and `06` | Simple area-level outcome; easy to reshape and map; suitable for spatial regression once joined to covariates | Single-date behavioural indicators; needs explanatory care; not itself multivariate | Good fallback or companion dataset for `05`/`06` |
| `data/risk-assessment-indicators` | Metadata JSON only; resource URLs point to seven ADM2 CSVs | `05` and `06` | Officially documented, multivariate, ADM2, socially meaningful, easy to explain | Local folder does not yet contain the CSV resources | Best candidate for `05`/`06` once downloaded |

## Candidate Dataset Decisions

-   `03-points.qmd`: `data/airbnb-ba` is now a **viable working dataset** because it contains listing-level point coordinates and related attributes. It is not Uruguay-specific, so it should be treated as an acceptable short-term chapter dataset rather than the ideal end state.
-   `04-spatial-interaction-model.qmd`: `data/fb-activity-spaces` is the **best available candidate** among the options reviewed.
-   `05-spatial-dependence.qmd` and `06-spatial-heterogeneity.qmd`: `data/risk-assessment-indicators` is the **strongest substantive choice**, with `data/fb-movement-distribution` as the **best fallback** or as a companion behavioural outcome.
-   `data/fb-social-connectedness` should be treated as a **backup dataset** for chapter `04`, useful if the chapter is reframed around social connectivity rather than observed flows.

## Meta Dataset Notes

### Montevideo traffic injuries open data

Dataset:

-   **Base anual de personas lesionadas en siniestros de tránsito**

Verified schema fields from the official metadata:

-   `Calle`
-   `Zona`
-   `Departamento`
-   `Localidad`
-   `Novedad`
-   `X` = longitude of crash location
-   `Y` = latitude of crash location

Observed local file:

-   `data/montevideo-traffic-injuries-2022.csv`

Observed structure from the downloaded CSV:

-   19 columns
-   7,802 rows
-   no missing `X` / `Y` values in the downloaded file
-   person-level records rather than unique crash-event records

Coordinate format:

-   `X` and `Y` are **not** stored as longitude/latitude
-   they are projected coordinates in **WGS 84 / UTM zone 21S**
-   CRS: **EPSG:32721**

Why it fits chapter `03`:

-   it is a true point-event dataset
-   it is Uruguay-specific
-   it is substantively intuitive for spatial concentration and hotspot analysis
-   it supports point maps, 2D binning, hex binning, and KDE naturally

Potential chapter uses:

-   map raw event locations
-   compare simple point maps against binned maps
-   create kernel density surfaces of injuries
-   explore clustering by zone or locality
-   discuss the difference between event concentration and underlying risk

Practical note:

-   the dataset is now stored locally and should be documented in `data.qmd`
-   analysis code should declare the CRS explicitly as `EPSG:32721`
-   for KDE and hotspot mapping, it may be preferable to collapse person-level records to unique crash events using `Novedad`, `X`, and `Y`

### `data/fb-activity-spaces`

Local file:

-   `activity_space_distributions_20260209_t_to_z.csv`

Observed structure:

-   home latitude / longitude
-   visit latitude / longitude
-   home and visit GADM IDs and names
-   polygon level
-   country
-   `visit_fraction`
-   `day_or_night`
-   date

Observed Uruguay coverage:

-   about **76,653** Uruguay rows
-   about **173** distinct home areas
-   about **204** distinct visit areas
-   both **daytime** and **nighttime** records

Why it fits chapter `04`:

-   it can be converted into a directed home-to-visit matrix
-   it supports flow mapping and distance-decay discussion
-   it allows comparison of daytime and nighttime mobility structures
-   it provides a much richer and more practical teaching dataset than a likely department-level migration matrix with only 19 origins and 19 destinations
-   it avoids the extra assembly work that a Uruguay internal migration matrix would likely require

Suggested derived variables for chapter `04`:

-   total outbound visit share by home area
-   non-local visit share: sum of `visit_fraction` where `home_gadm_id != visit_gadm_id`
-   local retention share: sum of `visit_fraction` where `home_gadm_id == visit_gadm_id`
-   mean travel distance between home and visit centroids
-   daytime versus nighttime outbound intensity
-   destination concentration or entropy by home area
-   top destination share by origin

Suggested processing workflow:

1.  filter to `country == "UY"`
2.  aggregate by `home_gadm_id`, `visit_gadm_id`, and `day_or_night`
3.  join ADM2 geometries or centroids
4.  compute inter-area distances
5.  generate flow maps and a simplified OD table for modelling

Teaching rationale:

-   internal migration is still worth introducing as the classical example of spatial interaction
-   for this workshop, `fb-activity-spaces` is the better empirical choice because students can work with a richer OD structure, clearer visual outputs, and a dataset that is already available in the repository
-   this keeps chapter `04` focused on modelling ideas rather than on reconstructing a migration matrix from external tables

### `data/fb-movement-distribution`

Local file:

-   `1922039342088483_2026-03-03.csv`

Observed structure:

-   `gadm_id`
-   `gadm_name`
-   country
-   polygon level
-   `home_to_ping_distance_category`
-   `distance_category_ping_fraction`
-   date

Observed Uruguay coverage:

-   **808** Uruguay rows
-   **202** ADM2 units
-   four distance bands:
    -   `0`
    -   `(0, 10)`
    -   `[10, 100)`
    -   `100+`

Why it fits chapters `05` and `06`:

-   it yields a compact area-level response variable after reshaping wide
-   it is easy to map and diagnose for spatial clustering
-   it can be joined to demographic covariates from the risk indicators or other official data

Suggested derived variables for chapters `05` and `06`:

-   immobility share: fraction in category `0`
-   short-range mobility share: fraction in `(0, 10)`
-   medium-range mobility share: fraction in `[10, 100)`
-   long-range mobility share: fraction in `100+`
-   mobility intensity index, for example a weighted combination of distance bands
-   long-versus-local ratio: `100+ / 0` or `(10+ km share) / local share`

Suggested modelling storyline:

-   chapter `05`: explain spatial dependence using one mobility outcome, for example long-range mobility share
-   chapter `06`: keep the same outcome and test whether associations vary by region or urban-rural context

### `data/fb-social-connectedness`

Local file reviewed:

-   `gadm2_shard_PY.csv`

Observed structure:

-   `user_country`
-   `friend_country`
-   `user_region`
-   `friend_region`
-   `scaled_sci`

Assessment:

-   this is a region-pair connectivity matrix rather than an observed movement matrix
-   it is potentially interesting for a chapter on relational geographies or network ties
-   it is less clean for a standard spatial interaction chapter built around flows, destinations, and distance decay
-   the current shard is very large and not obviously optimised for a Uruguay-first workflow

Working use case:

-   keep as an optional extension or enrichment dataset
-   do not treat it as the primary dataset for chapter `04`

## Risk Indicators Inventory

The folder `data/risk-assessment-indicators` currently contains metadata only:

-   `metadata-uruguay---risk-assessment-indicators.json`

The metadata identifies the dataset as **Uruguay - Risk Assessment Indicators**, updated on **11 March 2026**, and aggregated at **admin level 2**.

Documented component resources:

-   `URY_ADM2_demographics.csv`
-   `URY_ADM2_flood_exposure.csv`
-   `URY_ADM2_facilities.csv`
-   `URY_ADM2_coping.csv`
-   `URY_ADM2_rural_population.csv`
-   `URY_ADM2_access.csv`
-   `URY_ADM2_vulnerability.csv`

Documented thematic coverage:

-   demographics
-   rural population
-   service access
-   facilities
-   coping capacity
-   vulnerability
-   flood exposure

Examples of variables documented in the metadata:

-   `female_pop`
-   `children_u5`
-   `elderly`
-   `pop_u15`
-   `rural_pop_perc`
-   `education_count`
-   `hospitals_count`
-   `primary_healthcare_count`
-   `access_pop_education_5km`
-   `access_pop_hospitals_30min`
-   `female_pop_30cm`
-   `education_30cm_pct`

Why this is the strongest candidate for chapters `05` and `06`:

-   it is already organised at ADM2 level
-   it contains multiple socially meaningful covariates and outcomes
-   it supports a coherent storyline around vulnerability, access, and exposure
-   it is easier to justify to a social-science audience than platform mobility indicators alone

Recommended chapter use:

-   `05-spatial-dependence.qmd`: model one substantive outcome such as vulnerability, rurality, elderly share, or flood exposure and diagnose spatial autocorrelation
-   `06-spatial-heterogeneity.qmd`: continue with the same outcome and test whether relationships vary across regions, coastal/interior contexts, or urban-rural profiles

Immediate gap:

-   the repository currently holds the metadata, but **not the seven CSV resources themselves**
-   these files should be downloaded into `data/risk-assessment-indicators/` before committing to this dataset operationally

## `rhdx` Acquisition Path

The package [`rhdx`](https://github.com/dickoa/rhdx) appears suitable for fetching the **Uruguay - Risk Assessment Indicators** resources from HDX.

What was verified:

-   `rhdx` is an R client for HDX
-   its documented workflow uses:
    -   `set_rhdx_config(hdx_site = "prod")`
    -   `search_datasets(...)`
    -   `get_resource(...)`
    -   `read_resource(...)`
-   it also documents resource download methods on `HDXResource`, including download helpers
-   the local R environment does **not** currently have `rhdx` installed

Why it should work for this dataset:

-   the local metadata JSON already exposes the HDX dataset identity and seven resource download URLs
-   the dataset is public on HDX and the resources are plain CSV files
-   `rhdx` is designed specifically to search HDX datasets and read/download resources into R

Operational implication:

-   yes, this dataset should be fetchable through `rhdx`, assuming package installation and network access are available at execution time
-   because the resources are plain CSV files with stable URLs in the metadata, there is also a straightforward non-`rhdx` fallback using direct download

Illustrative `rhdx` workflow:

``` r
library(rhdx)

set_rhdx_config(hdx_site = "prod")

ds <- search_datasets("Uruguay - Risk Assessment Indicators", rows = 1)[[1]]
resources <- ds$get_resources()

# Example: read demographics directly into R
demo <- resources[[1]]$read_resource()

# Or download all resources to the project folder
purrr::walk(
  resources,
  ~ .x$download("/Users/franciscorowe/Library/CloudStorage/Dropbox/Francisco/training/2026/smds_uruguay/data/risk-assessment-indicators")
)
```

Practical caveat:

-   the package documentation surfaced is not recent, so minor API differences are possible at runtime
-   however, the overall approach is sound and low risk because the HDX resource URLs are already known

## Amended Plan

1.  Download and document the Montevideo traffic injuries dataset for `03-points.qmd`.
2.  Keep `data/airbnb-ba` as a fallback dataset for `03`, not the primary case study.
3.  Use `data/fb-activity-spaces` as the explicit main dataset for `04-spatial-interaction-model.qmd`, with internal migration retained only as conceptual framing.
4.  Acquire the seven HDX CSV resources for `data/risk-assessment-indicators`, preferably via `rhdx`, with direct URL download as fallback.
5.  Build chapters `05` and `06` around the risk-indicator ADM2 data, keeping one shared outcome-and-covariate storyline across both chapters.
6.  Keep `data/fb-movement-distribution` as a backup outcome source or as an extension exercise linked to the same ADM2 geography.
7.  Leave `data/fb-social-connectedness` out of the core teaching sequence unless chapter `04` is explicitly reframed around relational connectivity rather than mobility flows.

## Immediate Work Plan

1.  Define the Uruguay geographies to be used across the course.
2.  Select and download the replacement datasets for chapters `03`, `04`, `05`, and `06`.
3.  Rewrite `data.qmd` as the canonical inventory of the Uruguay datasets.
4.  Develop `preamble.qmd` so the workshop framing is explicit.
5.  Refine `01-embedding-space.qmd` and refocus `02-spatial-data-wrangling.qmd`.
6.  Replace data, text, and figures in chapters `03` to `06`.
7.  Check that all examples render cleanly and that the story flows across chapters.

## Open Decisions

-   What is the best common geography for the course: departments, municipalities, census zones, or another official unit? Municipalities for Uruguay

-   Is an official Uruguay internal migration OD matrix directly available, or does it need to be constructed from published tables? Again, only if these data are available at municipal level. If not, use the "Facebook Social Connectedness Index" at ADM2 level.

-   Which point dataset is the best balance between pedagogical clarity and data availability? Let's use data for AirBnb for Buenos Aires: /Users/franciscorowe/Library/CloudStorage/Dropbox/Francisco/training/2026/smds_uruguay/data/point-data/neighbourhoods.geojson

-   Do we want a national storyline, or a Montevideo-focused storyline where small-area data are richer?

## Data to be used:

Data for Uruguay from Movement Distribution (https://data.humdata.org/dataset/movement-distribution) could work for `05` and `06`; or, Data for Uruguay from Activity Space Maps ('/Users/franciscorowe/Library/CloudStorage/Dropbox/Francisco/Research/data/facebook-activity-spaces/Activity Space Maps documentation.pdf') Alternatively, it could be "access_pop_hospitals_30min" from: https://data.humdata.org/dataset/uruguay---risk-assessment-indicators

## Summary

This adaptation should be treated as a **Uruguay-focused workshop edition** of the existing repository, not as a full rewrite. The repository already contains most of the teaching infrastructure. The key task is to replace legacy case studies with a compact set of Uruguay datasets and align the text, code, and chapter flow around that new empirical storyline.
