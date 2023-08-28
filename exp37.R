# Load the ChickWeight dataset if not already loaded
data("ChickWeight")

# Convert "Diet" to a factor
ChickWeight$Diet <- as.factor(ChickWeight$Diet)

# (a) Create multi regression model to predict weight using "Time" and "Diet"
multi_reg_model <- lm(weight ~ Time + Diet, data = ChickWeight)

# (b) Predict weight for Time=10 and Diet=1
new_data <- data.frame(Time = 10, Diet = factor(1))  # Convert Diet to factor
predicted_weight <- predict(multi_reg_model, newdata = new_data)

cat("Predicted weight for Time = 10 and Diet = 1:", predicted_weight, "\n")

# (c) Calculate the error in the model for the prediction
actual_weight <- ChickWeight$weight[ChickWeight$Time == 10 & ChickWeight$Diet == 1]
error <- actual_weight - predicted_weight

cat("Error:", error)