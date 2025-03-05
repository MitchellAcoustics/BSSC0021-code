# Revised Lecture Plan: Multiple Linear Regression and ANOVA as Linear Models

## Core Philosophy and Approach
- Teach statistics through the unifying lens of the general linear model
- Show how common statistical tests are special cases of the same linear framework
- Emphasize understanding over memorization of isolated techniques
- Demonstrate relationships between tests rather than presenting them as separate tools

## Lecture Structure (2 hours)

### Part 1: The General Linear Model as a Foundation (30 minutes)

#### Opening Activity: The Beauty of Unified Statistical Thinking
- **Interactive Element**: Begin with a brief demonstration of multiple statistical analyses on the same dataset, all using the same linear model function
- **Code Point #1**: Demonstrate how `lm()` in R can perform t-tests, ANOVA, and regression
```
# CODE: Show how lm() can be used for different "tests"
# One-sample t-test: lm(y ~ 1)
# Independent t-test: lm(y ~ group)
# One-way ANOVA: lm(y ~ factor)
# Multiple regression: lm(y ~ x1 + x2)
```
- Discuss how traditional statistics teaching artificially divides what is fundamentally the same model

#### The General Linear Model Framework
- Present the general form: y = β₀ + β₁x₁ + β₂x₂ + ... + βₙxₙ + ε
- Explain how this single equation underlies most common statistical tests
- **Code Point #2**: Interactive visualization showing how the general model applies across scenarios
```
# CODE: Create visualization of the linear model family tree
# Demonstrate the hierarchical relationship between statistical tests
```
- **Interactive Element**: Students identify which components of the linear model are active in different tests

### Part 2: From Simple Models to Multiple Predictors (40 minutes)

#### Building from Simple Cases (15 minutes)
- Begin with the intercept-only model: y = β₀ + ε (one-sample t-test)
- Show how adding a single indicator/dummy variable creates the independent t-test
- **Code Point #3**: Demonstrate equivalence between t.test() and lm()
```
# CODE: Show equivalence between traditional tests and linear models
# t.test(y) vs. lm(y ~ 1)
# t.test(y1, y2) vs. lm(y ~ group)
# Display identical results
```
- **Interactive Element**: Students predict what changes in model output when model complexity increases

#### Extension to Multiple Regression (15 minutes)
- Explain how adding continuous predictors extends the model while maintaining the same framework
- **Code Point #4**: Demonstrate multiple regression using the HR Analytics dataset
```
# CODE: Build regression model with multiple predictors
# Show parameter estimates and interpretations
# Visualize relationships between predictors and outcome
```
- Discuss difference between categorical and continuous predictors within the same framework

#### Residuals and Model Assumptions (10 minutes)
- Emphasize how all linear models share the same core assumptions
- **Code Point #5**: Generate and interpret diagnostic plots
```
# CODE: Create diagnostic plots for different model types
# Show how the same diagnostics apply regardless of test name
```
- **Interactive Activity**: Students evaluate assumption violations in sample models

### Break (5 minutes)

### Part 3: ANOVA as a Linear Model (40 minutes)

#### Dummy Coding and ANOVA (15 minutes)
- Show how ANOVA is just a linear model with dummy-coded categorical predictors
- **Code Point #6**: Demonstrate one-way ANOVA using Fuel Consumption dataset
```
# CODE: One-way ANOVA as lm()
# Explicitly show the dummy coding
# Compare aov() and lm() results
```
- **Interactive Element**: Students translate between ANOVA tables and linear model outputs

#### Two-Way ANOVA and Interactions (15 minutes)
- Explain interactions as products of predictors in the linear model
- **Code Point #7**: Demonstrate two-way ANOVA as an extension of the linear model
```
# CODE: Two-way ANOVA as lm() with interaction terms
# Visualize interaction effects
# Compare traditional and linear model approaches
```
- Connect to dummy coding framework from earlier section

#### ANCOVA and Mixed Predictors (10 minutes)
- Show how categorical and continuous predictors can be combined in the same model
- **Code Point #8**: Demonstrate ANCOVA as a linear model
```
# CODE: Run ANCOVA using lm()
# Contrast with traditional approach
# Show how interpretation remains consistent
```
- **Interactive Element**: Students predict model results based on predictor types

### Part 4: Applications and Interpretation (25 minutes)

#### Applied Example: HR Analytics Dataset (15 minutes)
- Complete analysis using unified linear model approach
- **Code Point #9**: Full analysis using the HR Analytics dataset
```
# CODE: Build progressively more complex models of job satisfaction
# Show how different "tests" emerge naturally from the same framework
# Demonstrate prediction using the final model
```
- Discuss practical interpretation regardless of the "name" of the statistical test

#### Closing Discussion and Next Steps (10 minutes)
- Reflect on benefits of the unified approach
- Brief mention of extensions (generalized linear models, mixed effects models)
- **Interactive Element**: Students articulate connections between tests they previously thought of as distinct
- Preview of how this framework simplifies learning more advanced methods

## Interactive Components

1. **Linear Model Translation** (Individual activity)
   - Students translate between traditional test formulations and linear model equivalents
   - Identify which components of the general model are active in each case

2. **Prediction Challenge** (Paired work)
   - Students predict results from HR dataset using different model specifications
   - Develop intuition for how model components influence predictions

3. **Assumption Detective** (Small group work)
   - Examine diagnostic plots from different "named tests"
   - Identify how the same assumptions apply across all linear models

4. **Model Building Progression** (Guided demonstration)
   - Students follow along as models increase in complexity
   - Track changes in parameters and interpretation as predictors are added

5. **Interpretation Comparison** (Think-pair-share)
   - Compare interpretations from traditional test outputs and linear model outputs
   - Recognize the unified meaning regardless of statistical test "name"

## Materials and Dataset Preparation

1. **Datasets**
   - Fuel Consumption dataset for ANOVA examples
   - HR Analytics dataset for regression examples
   - Data dictionaries with variable descriptions

2. **Code Templates**
   - Pre-written R code demonstrating equivalence between traditional tests and linear models
   - Progressive model-building templates

3. **Visual Aids**
   - Linear model family tree showing relationships between statistical tests
   - Side-by-side comparisons of traditional and linear model outputs

4. **Student Exercises**
   - Translation exercises between statistical test language and linear model language
   - Progressive model building exercises

## Student Take-Home Materials

1. **Quarto Document Template**
   - Pre-loaded datasets and analysis framework
   - Code scaffolding for exploring linear model equivalences
   - Exercises on interpreting results from the unified perspective

2. **Reference Materials**
   - Linear models equivalence reference table (similar to blog post table)
   - Common model specifications for different research questions

3. **Practice Exercises**
   - Model building progression exercises
   - Interpretation challenges for different model outputs

This revised lecture plan embraces the unified linear model approach advocated in the blog post. It starts with the general linear model as the foundation and shows how various "named tests" are simply special cases of this unified framework. The progression builds from simple to complex, helping students see the connections rather than differences between statistical techniques. Interactive elements and code demonstrations reinforce how the same functions and conceptual framework apply across what are traditionally taught as separate statistical methods.