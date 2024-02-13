library(dplyr)
library(ggplot2)
library(corrplot)
#install.packages("corrplot")

ratings_data <- read.csv("‪C:/rabota/R/ratings.csv")
print(ratings_data)

# Group by 'MovieId' and calculate the average 'Rating' in each group
grouped_data <- ratings_data %>%
  group_by(MovieId) %>%
  summarize(Average_Rating = mean(Rating))

# Create a bar plot
m <- barplot(grouped_data$Average_Rating, 
             names.arg = grouped_data$MovieId, 
             col = "skyblue", 
             main = "Average Rating per Movie",
             xlab = "MovieId",
             ylab = "Average Rating")
print(m)


# Use t-test to compare the mean ratings of two groups (example)
movie1_ratings <- ratings_data %>% filter(MovieId == 1) %>% select(Rating)
movie2_ratings <- ratings_data %>% filter(MovieId == 2) %>% select(Rating)
t.test(movie1_ratings, movie2_ratings)

# Count the number of ratings for each movie
count_movie_ratings <- ratings_data %>%
  group_by(MovieId) %>%
  summarise(Count = n())

# Set the size of the plot
options(repr.plot.width=12, repr.plot.height=8)

# Create a line plot using ggplot2
ggplot(count_movie_ratings, aes(x = MovieId, y = Count)) +
  geom_line(color = "blue", linewidth = 1, aes(group = 1)) +
  geom_point(color = "blue", size = 3) +
  theme_minimal() +
  labs(title = "Number of Ratings per Movie",
       x = "MovieId",
       y = "Number of Ratings") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Correlation analysis
# Set the size of the plot
options(repr.plot.width = 10, repr.plot.height = 6)

# Create a correlation matrix
corr_matrix <- cor(subset(ratings_data, select = -Timestamp))

# Use corrplot to create a correlation heatmap
corrplot(corr_matrix, method = "color", tl.col = "black", tl.srt = 45, addCoef.col = "black")

# Linear regression example
reg_total <- lm(ratings_data$Rating ~ ratings_data$Timestamp)
summary(reg_total)

