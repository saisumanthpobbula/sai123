rm(list = ls())

#setwd("E://Documents//Jeevan(japan)")

japan <- read.csv("Japan earthquakes 2001 - 2018.csv", header = TRUE)

head(japan)
getwd()
str(japan)

dim(japan)

summary(japan)

head(japan, 2)

install.packages("ggpubr")

required_packages <- c("ggplot2", "dplyr", "tidyr", "corrplot")

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
    library(pkg, character.only = TRUE)
  } else {
    library(pkg, character.only = TRUE)
  }
}

print("All required packages are successfully installed and loaded.")

library(ggplot2)
library(dplyr)
library(tidyr)
library(corrplot)




# Question-1(A):

# Scatter plot with linear trendline
ggplot(japan, aes(x = mag, y = depth)) +
  geom_point(color = "blue", alpha = 0.5) + 
  geom_smooth(method = "lm", color = "red", se = FALSE) + 
  labs(
    title = "Scatter Plot of Earthquake Magnitude vs. Depth",
    x = "Magnitude",
    y = "Depth (km)"
  ) +
  theme_minimal()




# Question-1(B):


japan$mag_category <- cut(
  japan$mag,
  breaks = c(-Inf, 4, 6, Inf),
  labels = c("Low", "Medium", "High")
)


# Boxplot for depth by magnitude categories
ggplot(japan, aes(x = mag_category, y = depth)) +
  geom_boxplot(outlier.color = "red", fill = "lightblue") +
  labs(
    title = "Boxplot of Earthquake Depth by Magnitude Categories",
    x = "Magnitude Category",
    y = "Depth (km)"
  ) +
  theme_minimal()



# Question-2 (A):

japan$mag_category <- cut(
  japan$mag,
  breaks = c(-Inf, 4, 6, Inf),
  labels = c("Low", "Medium", "High")
)


# Boxplot for depth by magnitude categories
ggplot(japan, aes(x = mag_category, y = depth)) +
  geom_boxplot(outlier.color = "red", fill = "lightblue") +
  labs(
    title = "Boxplot of Earthquake Depth by Magnitude Categories",
    x = "Magnitude Category",
    y = "Depth (km)"
  ) +
  theme_minimal()


# Question-2 (B):

# Histogram of depth with normal curve overlay
ggplot(japan, aes(x = depth)) +
  geom_histogram(aes(y = ..density..), bins = 30, fill = "lightblue", color = "black", alpha = 0.6) +
  stat_function(fun = dnorm, args = list(mean = mean(japan$depth, na.rm = TRUE), sd = sd(japan$depth, na.rm = TRUE)), color = "red", size = 1) +
  labs(
    title = "Histogram of Earthquake Depth with Normal Curve Overlay",
    x = "Depth (km)",
    y = "Density"
  ) +
  theme_minimal()
