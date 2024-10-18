# Marketing Ads Sales Prediction
Predicting sales based on YouTube, Facebook, and newspaper advertising budgets using multiple regression in R.

This project performs multiple linear regression to predict sales based on advertising budgets for YouTube, Facebook, and newspapers, using the `marketing` dataset from the `datarium` package in R.

## Dataset
The dataset contains 200 observations of sales data, including:
- `youtube`: Advertising budgets on YouTube
- `facebook`: Advertising budgets on Facebook
- `newspaper`: Advertising budgets on newspapers
- `sales`: Total sales

## Goal
The objective is to help marketing teams better allocate their advertising budgets by predicting sales using multiple predictors.

## Steps
1. Load and explore the dataset.
2. Split the data into training and test sets.
3. Build a multiple regression model using the training data.
4. Predict sales on the test data.
5. Visualize the predicted vs. actual sales using `ggplot2`.

## Dependencies
You will need the following R packages to run the code:
- `datarium`
- `ggplot2`
- `caTools`

You can install them by running:
```r
install.packages(c("datarium", "ggplot2", "caTools"))

