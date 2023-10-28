library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)
library(plotly)
library(leaflet)
library(rpivotTable)
library(DT)
df3 <- df3 %>%
  filter(Income > 30000)

print(nrow(df))
df3 <- df3 %>%
select(Id, Year_Birth, Education, Marital_Status, Income, Response)
current_year <- 2023
df3 <- df3 %>%
  mutate(Age = current_year - Year_Birth)

df3 <- df3 %>%
  mutate(Rich_flag = Income > 80000)
  summary_df <- df3 %>%
  group_by(Education) %>%  
  summarize(Average_Income = mean(Income)) 
df3 <- df3 %>%
  left_join(summary_df, by = "Education")



scatter_plot <- plot_ly(data = df3, x = ~Age, y = ~Income, mode = "markers", type = "scatter")
scatter_plot <- layout(scatter_plot, xaxis = list(title = "Age"), yaxis = list(title = "Income"), title = "Точечный график Age vs. Income")
scatter_plot


labels <- c("Категория 1", "Категория 2", "Категория 3")
values <- c(30, 40, 50)
tree_map_data <- data.frame(
  labels = labels,
  parent = "",
  values = values
)
tree_map <- plot_ly(data = tree_map_data, ids = ~labels, labels = ~labels, parents = ~parent, values = ~values, type = "treemap")
tree_map <- layout(tree_map, title = "Карта-дерево")
tree_map

bugulma_lat <-  54.537835 
bugulma_lng <- 52.798571
bugulma_map <- leaflet() %>%
  addTiles() %>%
  addMarkers(lat = bugulma_lat, lng = bugulma_lng, popup = "Бугульма")
bugulma_map


print(datatable(df))


rpivotTable(df, rows = "Education", cols = "Marital_Status")
print(rpivotTable)