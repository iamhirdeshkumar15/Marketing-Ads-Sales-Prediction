# Install the datarium package to access the dataset
install.packages("datarium")
# Load the datarium package
library(datarium)
# Load the "marketing" dataset
data("marketing")
# Display the structure of the marketing dataset
str(marketing)
# Display the summary statistics of the marketing dataset
summary(marketing)
# Plot the marketing dataset with red color to visualize the relationships between variables
plot(marketing, col = "red")
# Install ggplot2 for advanced plotting
install.packages("ggplot2")
# Load the ggplot2 library
library(ggplot2)
# Set the ratio for splitting the dataset (75% training, 25% testing)
splitratio <- 0.75
# Print the split ratio to verify it
splitratio

# Set seed to make the random splitting reproducible
set.seed(123)
# Install caTools
install.packages("'caTools")
# Load the caTools library for data splitting
library(caTools)
# Split the data based on the 'youtube' variable (75% training, 25% testing)
sample <- sample.split(marketing$youtube, SplitRatio = splitratio)
# Show the sample split vector (TRUE for training, FALSE for testing)
sample
# Create the training set by selecting rows where sample == TRUE
train <- subset(marketing, sample == TRUE)
# Display the training set
train
# Create the testing set by selecting rows where sample == FALSE
test <- subset(marketing, sample == FALSE)
# Display the testing set
test
# Get the size of the training set (number of rows and columns)
train_size <- dim(train)
# Display the size of the training set
train_size
# Get the size of the testing set (number of rows and columns)
test_size <- dim(test)
# Display the size of the testing set
test_size

# Build a multiple regression model predicting sales based on youtube, facebook, and newspaper
model <- lm(sales ~ youtube + facebook + newspaper, data = train)
# Display the regression model details
model

# Display the summary of the model (coefficients, R-squared, p-values, etc.)
summary(model)

# Predict the sales on the test data using the model
pred <- predict(model, test)
# Display the predicted values
pred

# Get the size of the entire marketing dataset (rows and columns)
data_size <- dim(marketing)
# Display the size of the marketing dataset
data_size

# Calculate the number of test data points (25% of the dataset)
numx <- data_size[1] * (1 - splitratio)
# Display the number of test data points
numx

# Create a sequence for the x-axis based on the number of test data points
x_axis <- seq(numx)

# Display the x-axis sequence
x_axis

# Create a data frame combining x-axis, predicted values, and actual sales from the test set
df <- data.frame(x_axis, pred, test$sales)
# Display the data frame
df

# Initialize a ggplot object with the x-axis
g <- ggplot(df, aes(x = x_axis))
# Display the ggplot object
g

# Add a line for predicted values to the plot with red color
g <- g + geom_line(aes(y = pred, colour = "predicted"))
# Display the updated plot with predicted line
g

# Add points for predicted values to the plot
g <- g + geom_point(aes(x = x_axis, y = pred, colour = "predicted"))
# Display the updated plot with predicted points
g

# Add a line for actual sales values to the plot with blue color
g <- g + geom_line(aes(y = test$sales, colour = "actual"))
# Display the updated plot with actual sales line
g

# Add points for actual sales values to the plot
g <- g + geom_point(aes(x = x_axis, y = test$sales, colour = "actual"))
# Display the updated plot with actual sales points
g

# Customize the color legend to show "predicted" in red and "actual" in blue
g <- g + scale_colour_manual("", values = c(predicted = "red", actual = "blue"))
# Display the final plot
g

