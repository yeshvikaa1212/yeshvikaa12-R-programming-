# Load the required libraries
library(dplyr)
library(caTools)
library(glmnet)

# Load the iris dataset
data(iris)

# Select the required columns for modeling
data <- iris %>%
  select(Species, Petal.Width, Petal.Length)

# Set a random seed for reproducibility
set.seed(123)

# Split the data into training (80%) and test (20%) sets
split <- sample.split(data$Species, SplitRatio = 0.8)
train_data <- data[split, ]
test_data <- data[!split, ]

# Create the logistic regression model
model <- glm(Species ~ Petal.Width + Petal.Length, data = train_data, family = "binomial")

# Predict probabilities using the test data
probabilities <- predict(model, newdata = test_data, type = "response")

# Create a confusion matrix
predicted_classes <- ifelse(probabilities > 0.5, "versicolor", "setosa")
confusion_matrix <- table(predicted_classes, test_data$Species)

# Output the results
cat("Confusion Matrix:\n")
print(confusion_matrix)

accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
cat("\nAccuracy:", accuracy, "\n")
