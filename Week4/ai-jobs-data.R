library(tidyverse)
library(httr)
library(lubridate)
library(labelled)

# Get the project management dataset
# project_data_httr <- GET("https://www.kaggle.com/api/v1/datasets/download/mayarmohamedswilam/project-management")
# temp <- tempfile()
# download.file(project_data_httr$url, temp)
# project_data <- read_csv(unz(temp, "Project Management Dataset (1).csv"))
# unlink(temp)
# project_data <- project_data |>
#   janitor::clean_names() |>
#   mutate(
#     project_type = factor(project_type),
#     region = factor(region),
#     department = factor(department),
#     complexity = factor(complexity, levels=c('Low', 'Medium', 'High'), ordered=TRUE),
#     status = factor(status),
#     completion_percent = as.numeric(sub("%", "", completion_percent))/100,
#     start_date = mdy(start_date),
#     end_date = mdy(end_date)
#   )


ai_jobs_url <- GET("https://www.kaggle.com/api/v1/datasets/download/uom190346a/ai-powered-job-market-insights")
temp <- tempfile()
download.file(ai_jobs_url$url, temp)
ai_jobs <- read_csv(unz(temp, "ai_job_market_insights.csv"))
unlink(temp)
ai_jobs <- ai_jobs |>
  janitor::clean_names() |>
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
  rowwise() |>
  mutate(automation_risk = case_when(
    job_title == "HR Manager" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0.2, 0.4, 0.6)),
    job_title == "Marketing Specialist" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0, 0.1, 0.9)),
    job_title == "Software Engineer" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0.1, 0.1, 0.8)),
    job_title == "UX Designer" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0.3, 0.2, 0.5)),
    job_title == "Sales Manager" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0.1, 0.3, 0.6)),
    job_title == "AI Researcher" ~ sample(c("Low", "Medium", "High"), 1, replace = TRUE, prob = c(0.9, 0.1, 0.0)),
    .default = automation_risk
  )) |>
  ungroup() |>
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

write_csv(ai_jobs, "data/ai_jobs.csv")