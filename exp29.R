# Load the required library
library(datasets)

# Load the Iris dataset
data("iris")

# (i) Find dimension, Structure, Summary statistics, Standard Deviation of all features.
dim(iris)  # Dimension of the dataset
str(iris)  # Structure of the dataset
summary(iris)  # Summary statistics
sapply(iris[,1:4],sd)


# (ii) Find mean and standard deviation of features grouped by three species of Iris flowers
aggregate(. ~ Species, data = iris, mean)  # Mean by species
aggregate(. ~ Species, data = iris, sd)    # Standard Deviation by species

# (iii) Find quantile value of sepal width and length
quantile(iris$Sepal.Width)
quantile(iris$Sepal.Length)

# (iv) Create new data frame named iris1 with a new column Sepal.Length.Cate that categorizes Sepal.Length by quantile
iris1 <- iris
iris1$Sepal.Length.Cate <- cut(iris$Sepal.Length, breaks = quantile(iris$Sepal.Length), labels = FALSE)

# (v) Average value of numerical variables by two categorical variables: Species and Sepal.Length.Cate
aggregate(. ~ Species + Sepal.Length.Cate, data = iris1, mean)

# (vi) Average mean value of numerical variables by Species and Sepal.Length.Cate
aggregate(. ~ Species + Sepal.Length.Cate, data = iris1, mean)

# (vii) Create Pivot Table based on Species and Sepal.Length.Cate
pivot_table <- table(iris1$Species, iris1$Sepal.Length.Cate)
