# Load required libraries
library(ggplot2)

# Load the ChickWeight dataset
data(ChickWeight)

# (a) Create Box plot for "weight" grouped by "Diet"
boxplot_plot <- ggplot(ChickWeight, aes(x = as.factor(Diet), y = weight)) +
  geom_boxplot() +
  labs(x = "Diet", y = "Weight", title = "Box Plot of Weight Grouped by Diet")
print(boxplot_plot)

# (b) Create Histogram for "weight" features belonging to Diet-1 category
histogram_plot <- ggplot(ChickWeight, aes(x = weight)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(x = "Weight", y = "Frequency", title = "Histogram of Weight for Diet-1")
print(histogram_plot)

# (c) Create Scatter plot for "weight" vs "Time" grouped by Diet
scatter_plot <- ggplot(ChickWeight, aes(x = Time, y = weight, color = as.factor(Diet))) +
  geom_point() +
  labs(x = "Time", y = "Weight", title = "Scatter Plot of Weight vs Time Grouped by Diet")
print(scatter_plot)
