# ai-jobs-data.R
# Loads simulated data on the AI job market from kaggle, cleans it, and saves it as a CSV file.

######## Setup libraries #########
library(tidyverse)
library(httr)
library(lubridate)
library(labelled)

### Load the Data from online ###

# Point to the Kaggle dataset
ai_jobs_url <- GET("https://www.kaggle.com/api/v1/datasets/download/uom190346a/ai-powered-job-market-insights")

# Download to a temporary file
temp <- tempfile()
download.file(ai_jobs_url$url, temp)
# Read the temp csv into the ai_jobs dataframe
ai_jobs <- read_csv(unz(temp, "ai_job_market_insights.csv"))
unlink(temp)

######### Clean the data #########

ai_jobs <- ai_jobs |>
  # Use the `clean_names()` function from the janitor package to clean the column names
  # This will convert all column names to lowercase and replace spaces with underscores
  janitor::clean_names() |>
  # Adjusting the simulated data to create some variation
  # DO NOT do this with real data - just for the demonstration
  mutate(salary_usd = case_when(
    job_title == "HR Manager" ~ salary_usd - 15000,
    job_title == "Marketing Specialist" ~ salary_usd - 20000,
    job_title == "Software Engineer" ~ salary_usd - 10000,
    job_title == "UX Designer" ~ salary_usd - 25000,
    job_title == "Sales Manager" ~ salary_usd - 10000,
    job_title == "AI Researcher" ~ salary_usd + 30000,
    job_title == "Data Scientist" ~ salary_usd + 10000,
    .default = salary_usd
  )) |>
  rowwise() |> # set up to perform the following operations row by row
  # Adjust the distribution of automation risk across job titles
  mutate(automation_risk = case_when(
    job_title == "HR Manager" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0.2, 0.4, 0.6)),
    job_title == "Marketing Specialist" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0, 0.1, 0.9)),
    job_title == "Software Engineer" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0.1, 0.1, 0.8)),
    job_title == "UX Designer" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0.3, 0.2, 0.5)),
    job_title == "Sales Manager" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0.1, 0.3, 0.6)),
    job_title == "AI Researcher" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0.9, 0.1, 0.0)),
    .default = automation_risk
  )) |>
  ungroup() |> # remove the rowwise grouping

  # Convert columns to factors (categorical / ordinal)
  mutate(
    job_title = factor(job_title),
    industry = factor(industry),
    company_size = factor(company_size, levels = c("Small", "Medium", "Large"), ordered = TRUE),
    location = factor(location),
    ai_adoption_level = factor(ai_adoption_level, levels = c("Low", "Medium", "High"), ordered = TRUE),
    automation_risk = factor(automation_risk, levels = c("Low", "Medium", "High"), ordered = TRUE),
    required_skills = factor(required_skills),
    remote_friendly = factor(remote_friendly),
    job_growth_projection = factor(job_growth_projection, levels = c("Decline", "Stable", "Growth"), ordered = TRUE)
  ) |>
  # Add some metadata labels to the variables
  set_variable_labels(
    job_title = "Title of the job role",
    industry = "Industry in which the job is located",
    company_size = "Size of the company offering the job",
    location = "Geographic location of the job",
    ai_adoption_level = "Extent to which the company has adopted AI in its operations",
    automation_risk = "Estimated risk that the job could be automated within the next 10 years",
    required_skills = "Key skills required for the job role",
    salary_usd = "Annual salary offered for the job in USD",
    remote_friendly = "Indicates whether the job can be performed remotely",
    job_growth_projection = "Projected growth or decline of the job role over the next five years"
  )

########## Save Data ##########

# Write the cleaned data to a CSV file
write_csv(ai_jobs, "data/ai_jobs.csv")
