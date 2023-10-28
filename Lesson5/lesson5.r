library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)
df4 <- df3 %>%
  unite(New_Column, Education, Marital_Status, sep = ", ")
df4 <- transform(df4, RichFlag = as.numeric(as.factor(RichFlag)))
# str(df)
df4 <- df4 %>%
  mutate_all(funs(ifelse(is.na(.), 0, .)))
print(head(df4))
plot <- ggplot(df4, aes(x = Response, y = Age)) +
  geom_boxplot() +
  labs(title = "Диаграмма 'ящик с усами' Response vs. Age", 
       x = "Response", y = "Age")
ggsave("my_plot.png", plot) 
# #На основе полученной диаграммы "ящик с усами" можно сделать следующие выводы:
# #Распределение возраста (столбец Age) в зависимости от Response выглядит различным. Например, можно увидеть, что для некоторых категорий Response медианный возраст выше, чем для других категорий.
# #График позволяет оценить разброс возрастов (и, следовательно, вариабельность) в каждой категории Response. Некоторые категории могут иметь более широкий разброс возрастов, чем другие.
# #Диаграмма также показывает наличие выбросов (точек за пределами "усов" диаграммы) в разных категориях Response, что может быть интересно для анализа выбросов в данных.
# rows_with_9 <- str_which(df$Age, pattern = "9")
# result <- df[rows_with_9, ]
# print(result)
