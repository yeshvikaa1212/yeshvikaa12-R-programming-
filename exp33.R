# Load the necessary libraries if not already loaded
library(dplyr)
library(tidyr)

# Load the airquality dataset if not already loaded
data("airquality")

# (i) Get the Summary Statistics of airquality dataset
summary_stats <- summary(airquality)
print(summary_stats)

# (ii) Melt airquality dataset and display as a long-format data
melted_data_long <- airquality %>%
  pivot_longer(cols = -c(Month, Day), names_to = "Variable", values_to = "Value")
print(melted_data_long)

# (iii) Melt airquality data and specify month and day to be "ID variables"
melted_data_id <- airquality %>%
  pivot_longer(cols = -c(Month, Day), names_to = "Variable", values_to = "Value", names_prefix = "Var_")
print(melted_data_id)

# (iv) Cast the molten airquality data set with respect to month and day features
casted_data <- melted_data_id %>%
  pivot_wider(names_from = Variable, values_from = Value)
print(casted_data)

# (v) Use cast function appropriately and compute the average of Ozone, Solar.R, Wind, and temperature per month
averaged_data <- melted_data_id %>%
  group_by(Month, Variable) %>%
  summarise(Average = mean(Value, na.rm = TRUE)) %>%
  pivot_wider(names_from = Variable, values_from = Average)
print(averaged_data)