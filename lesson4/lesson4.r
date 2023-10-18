# 1
View(df3)
# Я считаю что плоские таблицы более удобны чем полноценная визуализация в
# тех случаях, когда нам нужно провести быстрые и непольшие манипуляции
# с данными и посмотреть результат, узнать максимальное и минимальное
# значение, отфильтовать  строки и т.д. 

# 2
library(pivottabler)
pt <- PivotTable$new()
pt$addData(df3)
pt$addColumnDataGroups("Marital_Status")
pt$addRowDataGroups("Education")
pt$defineCalculation(calculationName="Total count", summariseExpression="n()")
pt$evaluatePivot()
pt

# 3
library (ggplot2)

# schema <- ggplot(df3, aes(fill=RichFlag, y=Education, x=Count)) + geom_bar(position='stack', stat='identity')
gg <- ggplot(df3, aes(x = Education, fill = factor(RichFlag))) +
  geom_bar(position = "dodge") +
  labs(title = "Столбчатая диаграмма по образованию с разделением по Rich_flag",
       x = "Образование",
       y = "Количество наблюдений") +
  scale_fill_manual(values = c("FALSE" = "red", "TRUE" = "green")) +
  theme_minimal()
print(gg)

gg1 <- ggplot(df3, aes(x = Year_Birth)) +
  geom_line(stat = "count", color = "red") + 
  labs(title = "Линейная диаграмма по году рождения",
       x = "Год рождения",
       y = "Количество наблюдений") +
  theme_minimal()
print(gg1)