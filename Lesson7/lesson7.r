df <- read.csv("R/lesson2/ДЗ2_vgsales.csv")
print(head(df,3))
library(shiny)
library(dplyr)
library(ggplot2)

avg_sales <- df %>%
  summarise(
    avg_NA_Sales = mean(NA_Sales),
    avg_EU_Sales = mean(EU_Sales),
    avg_JP_Sales = mean(JP_Sales),
    avg_Other_Sales = mean(Other_Sales)
  )

# Построение линейной диаграммы
grathic <- ggplot(df, aes(x = Year)) +
  geom_line(aes(y = NA_Sales), color = "blue") +
  geom_line(aes(y = EU_Sales), color = "red") +
  geom_line(aes(y = JP_Sales), color = "green") +
  geom_line(aes(y = Other_Sales), color = "purple") +
  labs(x = "Year", y = "avg_sales") +
  scale_x_continuous(labels = scales::comma) +
  scale_y_continuous(labels = scales::comma) +
  theme_minimal()


summary <- df %>%
  group_by(Genre) %>%
  summarise(
    NA_Sales = sum(NA_Sales),
    EU_Sales = sum(EU_Sales),
    JP_Sales = sum(JP_Sales),
    Other_Sales = sum(Other_Sales)
  )

# Построение столбчатой диаграммы
grathic2 <- ggplot(summary, aes(x = Genre, y = NA_Sales, fill = Genre)) +
  geom_bar(stat = "identity") +
  labs(x = "Genre", y = "Sales", title = "Sales by Genre") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

observe({
    req(input$platform)
    filtered_df <- df %>% filter(Platform %in% input$platform)
    output$table <- renderTable({
        filtered_df
    })
})

observeEvent(input$yearrange, {
    min_year <- input$yearrange[1]
    max_year <- input$yearrange[2]
    filtered_data <- reactive({
        df %>%
        filter(Year >= min_year & Year <= max_year)
    })
    output$table <- renderTable({
        filtered_data()
    })
})