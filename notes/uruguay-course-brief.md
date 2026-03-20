# Spatial Data Modelling for Social Scientists: Project Brief

## Purpose

This repository supports the **Spatial Data Modelling for Social Scientists** course to be taught at **Universidad de la República, Uruguay**, from **23 to 27 March 2026**. The course reuses the structure, coding approach, and much of the pedagogical logic of the original material, but it is being refocused around **Uruguay-relevant examples and data**.

The goal is not to recreate the full original book. The goal is to produce a compact, coherent course sequence that students can follow from the opening pages through the main applied chapters, with enough substance that they can return to the material later and continue learning on their own.

## Editorial Notes

- Prefer the term **course** rather than **workshop** unless the formal institutional programme title requires the original wording.
- Avoid overly compressed summaries. Descriptions should usually be a little longer than two sentences so they feel substantive rather than skeletal.
- The tone should leave students with the sense that there is enough depth here to support further self-study if they want to explore concepts or techniques on their own time.
- Interpretations of results should be explicit, intuitive, and substantively meaningful so students can understand what the findings actually say about the problem being studied.
- Include relevant references throughout the chapters so students have clear pathways to explore concepts, methods, and applications further if they want to follow up on their own.
- For maps and visualisations, use **viridis** palettes for sequential data and **RdBu** for diverging data, centring diverging series on `0`.
- Chapters should source and use the shared plotting template in `style/data-visualisation_theme.R` rather than redefining local plotting helpers inside chapter code chunks.
- Do **not** add chapter-level fallback blocks that recreate functions such as `course_text_theme()`, `theme_map_course()`, `theme_plot_course()`, or `scale_fill_course_seq_c()`. If the shared style file needs to change, change it there once and reuse it everywhere.
- In code chunks, add short annotation lines or brief comments for key sections of the code so students can follow what each important step is doing without needing to reverse-engineer the logic on their own.

## Scope

### In scope

- `index.qmd`
- `course-overview.qmd`
- `01-embedding-space.qmd`
- `02-spatial-data-wrangling.qmd`
- `03-points.qmd`
- `04-spatial-interaction-model.qmd`
- `05-spatial-dependence.qmd`
- `06-spatial-heterogeneity.qmd`
- `data.qmd`
- `references.qmd`

### Out of scope for this course adaptation

- `07-multilevel-modelling.qmd`
- `08-weighted-regression-modelling.qmd`
- `09-spatio-temporal-wrangling.qmd`
- `10-spatio-temporal-modelling.qmd`
- `11-spatial-machine-learning.qmd`
- `platform.qmd`
- `preamble.qmd` as a standalone course chapter

## Reuse Strategy

Most of the repository structure can be reused. The main changes are expected in:

- chapter framing and course-facing text
- datasets and examples
- figures, maps, and code chunks tied to non-Uruguay case studies
- practical instructions for students before the course starts

The adaptation should preserve the core strengths of the original materials:

- Quarto chapter structure
- `R`-first workflow
- applied emphasis over formal derivation
- progressive movement from concepts to visualisation and modelling

## Course Narrative

The course should tell a clear progression:

1. what makes spatial data different from non-spatial data
2. how to work with spatial objects in `R`
3. how point data can reveal spatial concentration and surfaces
4. how flows connect places and can be analysed through origin-destination relationships
5. how nearby areas influence one another
6. how relationships vary across space

There does **not** need to be one common geography across the whole course. Different chapters can use different geographies if that makes the teaching clearer or the data better suited to the method.

## Shared Analytical Workflow

For chapters that model an outcome variable, the analysis should begin with a descriptive exploration of that outcome before moving to formal models.

- Start by examining the outcome variable descriptively using a kernel histogram.
- Use that opening exploration to discuss the shape of the distribution and any visible concentration patterns.
- After the descriptive step, fit a standard linear regression model as the baseline model before introducing more explicitly spatial modelling approaches.

This should be treated as a common teaching pattern across the modelling chapters so students see a consistent progression from description to baseline inference and then to spatial extension.

## Shared Chapter Structure for `03` to `06`

Chapters `03` to `06` should follow a common internal structure so students become familiar with a stable analytical workflow as the course progresses. The aim is for each chapter to feel recognisable in shape, even when the substantive data and the spatial method change.

The expected section order is:

1. Introduction / context and aims
2. Dependencies
3. Data description
4. Data wrangling
5. Data exploration
6. Baseline modelling
7. Method-specific extension focused on the chapter’s core technique

The final section should be the flexible part of the chapter. That is where the chapter should move beyond the shared template and focus on the distinctive technique being taught, such as point-pattern methods, flow analysis, spatial dependence, or spatial heterogeneity.

Within Section 7, chapters should include three recurring components:

1. statistical inference and interpretation of results
2. model assessment
3. model prediction, including how to use the model for prediction in practice

For regression model assessment, report and discuss relevant measures of fit such as `AIC` and `R2`, alongside any other chapter-appropriate diagnostics.

This structure should also be visible in the chapter text itself. Students should be able to see that each chapter moves from context, to data, to preparation, to exploration, to a simple baseline model, and then to the more explicitly spatial technique that the chapter is designed to teach.

## Book Structure

The current rendered course structure should be:

1. `index.qmd` as the **Welcome** chapter
2. `course-overview.qmd` as the substantive **Course Overview** and setup guide
3. Part I
   - `01-embedding-space.qmd`
   - `02-spatial-data-wrangling.qmd`
4. Part II
   - `03-points.qmd`
   - `04-spatial-interaction-model.qmd`
5. Part III
   - `05-spatial-dependence.qmd`
   - `06-spatial-heterogeneity.qmd`
6. `data.qmd` as a short **Datasets** chapter
7. `references.qmd`

`course-overview.qmd` should remain unnumbered so the numbered sequence starts with `01-embedding-space.qmd`.

## Chapter Plan

## `index.qmd` (Welcome)

Planned role:

- welcome students to the course
- briefly introduce the topic and why spatial data matter in the social sciences
- give a concise orientation to the course
- direct students to the Course Overview chapter for practical guidance and setup

Needed work:

- keep the page concise and student-facing
- retain a short explanation of the Uruguay-focused adaptation
- include a short forward link to `course-overview.qmd`
- avoid turning the opening page into a full preamble chapter

## `course-overview.qmd`

Planned role:

- provide the substantive orientation to the course
- explain course aims, audience, structure, and how the course fits in the wider toolkit
- tell students what they need before the course begins
- provide practical instructions for setup and repository use

Required content:

- course aims
- audience
- how the course is organised by parts
- how this course fits in the wider toolkit
- software requirements: `R`, RStudio, Quarto
- package dependencies
- how to download or clone the repository
- how to open and reuse the repository
- links to the relevant tools and resources
- a clear warning that students must have everything installed before the first session because the practical work will begin immediately

## `01-embedding-space.qmd`

Planned role:

- introduce the conceptual foundations of spatial thinking
- explain spatial data types, hierarchical geographies, and core issues such as MAUP, ecological fallacy, spatial dependence, and heterogeneity
- prepare students for the applied material that follows

Needed work:

- refine and tighten the prose
- add Uruguay-relevant examples where useful
- improve the transitions between concepts
- create or revise visuals for hierarchical data structure and key challenges

## `02-spatial-data-wrangling.qmd`

Planned role:

- focus on what is specific about spatial data
- introduce the practical tools needed to read, inspect, transform, project, join, and map spatial data in `R`

Refocus priorities:

- geometries: points, lines, polygons, and only brief raster mention if needed
- coordinate reference systems and projections
- attributes versus geometry columns
- simple features and `sf`
- practical mapping with `ggplot2` and/or `tmap`

Needed work:

- reduce generic `R` material that does not support the spatial learning goals
- foreground `sf` workflows
- use Uruguay boundaries and attributes as the running examples

## `03-points.qmd`

Planned role:

- introduce point-pattern thinking through a Uruguay case
- cover point maps, binning, KDE, and interpolation in an intuitive and applied way

Chosen dataset:

- `data/montevideo-traffic-injuries-2022.csv`

Key data decision:

- treat the data as **unique crash events**, not person-level records
- collapse records using `Novedad`, `X`, and `Y`

Coordinate system:

- the local file uses **EPSG:32721**
- analysis code should declare the CRS explicitly

Fallback dataset:

- `data/airbnb-ba`

## `04-spatial-interaction-model.qmd`

Planned role:

- teach origin-destination thinking
- move from visualising flows to modelling flows

Chosen dataset:

- `data/fb-activity-spaces`

Rationale:

- internal migration remains a useful conceptual reference
- however, `fb-activity-spaces` is the better teaching dataset because it is already local, richer in structure, and better suited to practical flow visualisation and modelling
- internal migration can be mentioned as the classical substantive application, but it is not the main empirical case study for this chapter

Expected chapter work:

- aggregate home-to-visit flows
- join centroids or area geometries
- compute inter-area distances
- visualise flows
- introduce a simplified interaction-model logic

## `05-spatial-dependence.qmd`

Planned role:

- introduce non-spatial regression, spatial autocorrelation, spatial weights, and spatial regression
- do so through a substantively meaningful Uruguay outcome

Chosen dataset family:

- Uruguay risk indicators

Chosen outcome:

- `access_pop_hospitals_30min`

Chosen covariate set:

- `rural_pop_perc`
- `elderly_share`
- `hospitals_count`

Implementation note:

- if the source files provide `elderly` as a count rather than a share, compute `elderly_share` before modelling

## `06-spatial-heterogeneity.qmd`

Planned role:

- continue directly from chapter `05`
- show that relationships do not need to be constant across space

Chosen outcome and covariates:

- keep the same outcome and covariate set as chapter `05`
- outcome: `access_pop_hospitals_30min`
- covariates: `rural_pop_perc`, `elderly_share`, `hospitals_count`

Method emphasis:

- **spatial fixed effects**
- **spatial regimes**

Both should be included so students see two complementary ways of handling spatial heterogeneity.

## `data.qmd`

Planned role:

- provide a short course-facing guide to the datasets used in the main applied chapters
- briefly describe what each dataset is, what kind of spatial object or geography it represents, and why it is used in that chapter
- help students connect the empirical examples across the course without overloading them with metadata

Content guidance:

- keep the chapter concise and practical
- organise it by chapter rather than by data provider
- include the main dataset for each applied chapter from `03` to `06`
- note key analytical decisions where relevant, such as crash-event aggregation in chapter `03`
- keep the style similar in spirit to the datasets chapter in the original book, but shorter and adapted to the Uruguay course version

## Relevant References from Francisco's Work

Where relevant, chapters should draw explicitly on Francisco's own work in addition to the more general background references already in the bibliography. These references should be used selectively where they strengthen the chapter narrative or give students a clear route into follow-up reading.

Suggested links by chapter:

- `index.qmd` and `course-overview.qmd`: `@rowe_arribas_2022` as the main source text underpinning the broader course design.
- `01-embedding-space.qmd`: `@rowe2022a` as a general reference for geographic data science concepts and framing.
- `03-points.qmd`: `@tao2018` as an example of point-based transport analysis connected to spatial pattern interpretation.
- `04-spatial-interaction-model.qmd`: `@rowe2020` and `@rowe2022` as the most directly relevant references for migration, flows, and spatial interaction modelling.
- `05-spatial-dependence.qmd`: `@rowe2022a` where useful as a broader reference for spatial data science framing and interpretation.
- `06-spatial-heterogeneity.qmd`: `@patias2021` and `@patias2019` where useful for thinking about uneven spatial trajectories, spatial variation, and neighbourhood change.

These references do not need to dominate the chapters, but they should be incorporated where they help make the material more coherent and give students a stronger sense of the wider research agenda behind the course.

Reference use should therefore be intentional rather than mechanical. All chapters should include relevant references, and chapters should incorporate Francisco's work where it is substantively connected to the topic, method, or interpretation being taught. However, references from Francisco's work should not be inserted simply to satisfy a quota. The aim is to use them where they genuinely strengthen the chapter and provide students with meaningful follow-up reading.

## Data Decisions Summary

### Chapter `03`

- primary dataset: Montevideo traffic injuries
- analytical unit: unique crash events
- CRS: `EPSG:32721`
- fallback: Airbnb Buenos Aires

### Chapter `04`

- primary dataset: `fb-activity-spaces`
- internal migration kept as conceptual framing only

### Chapters `05` and `06`

- primary dataset family: Uruguay risk indicators
- outcome: `access_pop_hospitals_30min`
- covariates: `rural_pop_perc`, `elderly_share`, `hospitals_count`
- fallback or extension dataset: `fb-movement-distribution`

## Package and Setup Guidance

Students should be asked to install and test before the course begins:

- `R`
- RStudio
- Quarto

Core `R` packages currently expected:

- `dplyr`
- `tidyr`
- `readr`
- `stringr`
- `purrr`
- `lubridate`
- `janitor`
- `ggplot2`
- `sf`
- `units`
- `tmap`
- `scales`
- `viridis`
- `hexbin`
- `spdep`
- `spatialreg`

## Immediate Work Plan

1. keep `index.qmd` as the Welcome chapter
2. develop `course-overview.qmd` as the substantive orientation and setup guide
3. replace placeholder chapter content in `01` to `06` with the actual course material
4. download any remaining external data needed for `fb-activity-spaces` or risk-indicator workflows
5. document the Uruguay datasets properly in `data.qmd`
6. render regularly to keep the course site working while the material is being rewritten

## Open Decisions

No major methodological decisions remain. The main remaining work is operational:

- finish rewriting the chapter content
- bring in any remaining external data files
- document installation and package issues clearly for students
- keep the rendered course site aligned with the evolving source files

## Summary

This adaptation should be treated as a **Uruguay 2026 course edition** of the repository rather than a full rewrite of the original book. The teaching infrastructure is already largely in place. The key task is to align the chapter text, code, figures, and datasets with the agreed course structure and the chosen Uruguay-focused examples.
