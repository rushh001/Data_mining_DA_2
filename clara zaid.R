# Load required library
library(cluster)

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

# Perform CLARA clustering
clara_result <- clara(clustering_data, k = 3, samples = 10, metric = "euclidean")

# Print clustering summary
print(clara_result)

# Plot the clusters
plot(clara_result, data = clustering_data)
