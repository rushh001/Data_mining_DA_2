# Load required libraries
library(tidyverse)
library(cluster)

# Create the dataset
student_data <- data.frame(
  StudentID = 1:35,
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

# Standardize the data
scaled_data <- scale(clustering_data)

# Perform K-medoids clustering
set.seed(123)  # For reproducibility
kmedoids_model <- pam(scaled_data, k = 3)  # Adjust number of clusters as needed

# Add cluster assignments to the original dataset
student_data$Cluster_kmedoids <- as.factor(kmedoids_model$clustering)

# Visualize the clusters
ggplot(student_data, aes(x = Marks, y = Age, color = Cluster_kmedoids)) +
  geom_point() +
  labs(title = "K-medoids Clustering of Students",
       x = "Marks",
       y = "Age",
       color = "Cluster") +
  theme_minimal()
