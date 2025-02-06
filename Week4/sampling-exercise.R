library(tidyverse)

# Input the values of the samples

sample_1 <- c(83.2, 82.6, 82.6, 82.6, 93.2, 94, 94, 48.5, 33.6, 33.6)
sample_2 <- c(88, 48, 23, 23, 23, 23, 23, 23, 23, 23)
sample_3 <- c(83.2, 82.6, 82.6, 99, 100, 145, 123, 222, 111, 111)
# sample_4 <- c(..., ..., ..., ...)

# ... and so on

# Create a table with the samples and an id column

data <- tibble(sample_1, sample_2, sample_3) |>
  gather(key = "sample", value = "value")

data # Look at the table



# Calculate the mean of each sample

sample_means <- data |>
group_by(sample) |>
summarise(mean = mean(value))

sample_means # Look at the means
#
# # Plot the sampling distribution
#
ggplot(sample_means, mapping = aes(x = mean)) +
  geom_histogram() +
  theme_minimal()
