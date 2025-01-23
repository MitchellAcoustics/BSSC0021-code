# Week 2: Data Visualization with ggplot2

This week we'll be diving into data visualization using R's powerful ggplot2 package. We'll learn about the Grammar of Graphics - a systematic approach to creating visualizations that will help you create more effective and beautiful plots.

Follow along with or review the interactive tutorial here: [https://drandrewmitchell.com/BSSC0021-code/#/title-slide](https://drandrewmitchell.com/BSSC0021-code/#/title-slide)

## What we'll cover:
- The fundamental principles of the Grammar of Graphics
- Building plots layer by layer using ggplot2
- Working with different types of variables (categorical and numerical)
- Creating various types of plots (scatter plots, line plots, bar charts, etc.)
- Adding aesthetics like color and shape to encode additional information
- Making plots more accessible and informative with proper labeling

We'll be using the Palmer Penguins dataset to learn these concepts, creating plots that help us understand relationships between different penguin measurements.

## Practice Exercise
At the end of the tutorial, you'll get hands-on practice with the DataAnalytics package. If you haven't already, install it with:

```r
devtools::install_github("antoinevernet/DataAnalytics")
```

Then run:

```r
learnr::run_tutorial("02-Visualisation", package = "DataAnalytics")
```

This interactive tutorial will help reinforce the concepts we cover in class.

You are also encouraged to do additional practice by completing the Data Visualization exercise from R for Data Science. This tutorial package can be installed and run the same way as DataAnalytics:

```r
install.packages("r4ds.tutorial")
learnr::run_tutorial("01-data-visualization", package = "r4ds.tutorial")
```

Looking forward to exploring data visualization with you!
