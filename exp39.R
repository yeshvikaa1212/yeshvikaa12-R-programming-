# Load required library
library(datasets)
library(ggplot2)

# Load the USArrests dataset
data("USArrests")

# (i) (a) Summary of Data set, including number of Features, types, number of records, and statistical features
features <- colnames(USArrests)
num_records <- nrow(USArrests)
summary_data <- summary(USArrests)

print("Features:")
print(features)

print("Number of Records for Each Feature:")
print(sapply(USArrests, length))

print("Statistical Summary:")
print(summary_data)

# (i) (b) Print the state which saw the largest total number of rape
max_rape_state <- row.names(USArrests)[which.max(USArrests$Rape)]
cat("State with the largest total number of rape:", max_rape_state, "\n")

# (i) (c) Print the states with the max & min crime rates for murder
max_murder_state <- row.names(USArrests)[which.max(USArrests$Murder)]
min_murder_state <- row.names(USArrests)[which.min(USArrests$Murder)]

cat("State with the highest crime rate for murder:", max_murder_state, "\n")
cat("State with the lowest crime rate for murder:", min_murder_state, "\n")

# (ii) (a) Find the correlation among the features
correlation_matrix <- cor(USArrests)
print("Correlation Matrix:")
print(correlation_matrix)

# (ii) (b) Print the states which have assault arrests more than median of the country
median_assault <- median(USArrests$Assault)
states_above_median_assault <- row.names(USArrests)[USArrests$Assault > median_assault]
cat("States with assault arrests more than median:", states_above_median_assault, "\n")

# (ii) (c) Print the states in the bottom 25% of murder
murder_quantile_25 <- quantile(USArrests$Murder, 0.25)
states_bottom_25_murder <- row.names(USArrests)[USArrests$Murder < murder_quantile_25]
cat("States in the bottom 25% of murder:", states_bottom_25_murder, "\n")

# (iii) (a) Create a histogram and density plot of murder arrests by US state
hist_density_murder <- ggplot(USArrests, aes(x = Murder)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "black", alpha = 0.7) +
  geom_density(color = "red") +
  labs(x = "Murder Arrests", y = "Frequency", title = "Histogram and Density Plot of Murder Arrests")
print(hist_density_murder)

# (iii) (b) Create a scatter plot showing the relationship between murder arrest rate and proportion of the population that is urbanized, colored by assault arrest rates
scatter_murder_urban_assault <- ggplot(USArrests, aes(x = UrbanPop, y = Murder, color = Assault)) +
  geom_point() +
  labs(x = "Urban Population (%)", y = "Murder Arrests", title = "Scatter Plot: Murder Arrests vs. Urban Population (Colored by Assault Arrests)")
print(scatter_murder_urban_assault)

# (iii) (c) Create a bar graph to show the murder rate for each of the 50 states
bar_plot_murder <- ggplot(USArrests, aes(x = reorder(row.names(USArrests), Murder), y = Murder)) +
  geom_bar(stat = "identity", fill = "blue") +
  coord_flip() +
  labs(x = "State", y = "Murder Rate", title = "Murder Rate for Each State")
print(bar_plot_murder)
