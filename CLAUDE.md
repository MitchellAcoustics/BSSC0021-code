# CLAUDE.md - Guidelines for R Code Development

## Build/Render/Test Commands
- Render all Quarto documents: `quarto render`
- Render specific document: `quarto render path/to/file.qmd`
- Run R script: `Rscript path/to/script.R`
- Run tests interactively in RStudio: `source("path/to/test.R")`

## Code Style Guidelines
- Indentation: 2 spaces (no tabs)
- Package loading: use `library(tidyverse)` at the top of scripts
- Always use the pipe operator `|>` (not `%>%`)
- Variable naming: use snake_case for all names (e.g., `sample_means`)
- Function naming: use verbs that describe the action (e.g., `calculate_mean`)
- Code comments: add comments to explain "why" not "what"
- Always include meaningful plot labels with `labs()` in ggplot
- Use theme_minimal() for consistent plot styling
- Set warning=FALSE and message=FALSE in Quarto chunk options
- Prefer tidyverse functions over base R when possible