# Load required libraries
library(tidyverse)

# Create the dataset
student_data <- data.frame(
  Marks = c(85, 70, 92, 65, 78, 88, 75, 85, 60, 82, 93, 68, 90, 72, 80, 85, 77, 95, 63, 87, 
            98, 73, 89, 67, 81, 82, 79, 94, 69, 84, 91, 76, 86, 66, 83),
  Subject = c("Math", "English", "Science", "History", "Computer Science", "Math", "English", 
              "Science", "History", "Computer Science", "Math", "English", "Science", "History", 
              "Computer Science", "Math", "English", "Science", "History", "Computer Science", 
              "Math", "English", "Science", "History", "Computer Science", "Math", "English", 
              "Science", "History", "Computer Science", "Math", "English", "Science", "History", 
              "Computer Science"),
  Grade = c("A", "B", "A+", "C", "B+", "A", "B-", "A", "D", "B", "A+", "C+", "A-", "B-", "B+", 
            "A", "B", "A+", "C-", "A", "A+", "B-", "A-", "C", "B", "B+", "B+", "B", "A+", "C+", 
            "A-", "B", "A+", "B", "A"),
  Gender = c("Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", 
             "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", 
             "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", 
             "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male"),
  Age = c(18, 17, 18, 16, 17, 18, 17, 18, 16, 17, 18, 17, 18, 16, 17, 18, 17, 18, 16, 17, 18, 
          17, 18, 16, 17, 18, 17, 18, 16, 17, 18, 17, 18, 16, 17),
  City = c("New York", "Chicago", "Los Angeles", "Houston", "Atlanta", "Seattle", "San Diego", 
           "Orlando", "Miami", "Phoenix", "Detroit", "Baltimore", "Portland", "Memphis", "Dallas", 
           "Denver", "Austin", "Boston", "Nashville", "San Jose", "Las Vegas", "Raleigh", "Madison", 
           "Columbus", "Charlotte", "Houston", "San Jose", "Phoenix", "Atlanta", "Seattle", "Detroit", 
           "Houston", "Orlando", "Chicago", "Atlanta")
)

# Select relevant columns for clustering
clustering_data <- student_data[, c("Marks", "Age")]

# Perform hierarchical clustering with different linkage methods
methods <- c("ward.D", "ward.D2", "single", "complete", "average", "mcquitty", "median", "centroid")
# Store clustering results
clustering_results <- list()

for (method in methods) {
  clustering_results[[method]] <- hclust(dist(clustering_data), method = method)
}

# Plot dendrogram for each method
par(mfrow = c(2, 4))  # Adjust layout as needed
for (i in 1:length(methods)) {
  plot(clustering_results[[methods[i]]], main = methods[i], xlab = "", sub = "")
}
