telephones_data <- list(
brand = c("realme_c51","oppo_a17k","vivo_y16","realme_104G","iphone_XR"),
cpu = c("Unisoc_T612","MediaTek_Helio_G35","MediaTek_Helio_P35","MTK_Helio_G99","Apple_A12_Bionic"),
ram = c(4,3,3,8,3),
rom = c(128,64,32,256,128),
camera = c(50,8,13,50,50),
diagonal = c(6.74,6.56,6.51,6.4,6.6),
price = c(9000,6500,5600,18000,27000))

# Добавление данных
telephones_data$owner <- c("Ilya", "Alice", "Bob", "Eva", "Mike")

# Удаление данных
telephones_data$owner <- NULL


# Индексирование списков
print(telephones_data$brand)
print(telephones_data[[3]])
print(telephones_data$features$safety)

# Пример lapply
telephones_data_upper <- lapply(telephones_data, function(x) toupper(x))

# Пример sapply
telephones_data_lower <- sapply(telephones_data, function(x) tolower(x))

# Создание датафрейма из списков
telephones_df <- data.frame(telephones_data)

# Сохранение датафрейма в CSV
write.csv(telephones_df, "telephones_data.csv", row.names = FALSE)

# Загрузка датафрейма из CSV
loaded_telephones_df <- read.csv("telephones_data.csv")

# Построение гистограммы и диаграммы со столбцами для переменной "price"
hist(loaded_telephones_df$price, main = "Telephones Prices Distribution", xlab = "Price", col = "lightblue", border = "black")
barplot(loaded_telephones_df$price, main = "Telephones Prices", xlab = "telephones", ylab = "Price", col = "skyblue", border = "black")


# Пример lapply
summary_stats <- lapply(loaded_telephones_df, summary)

# Пример sapply
mean_prices <- sapply(loaded_telephones_df$price, mean)

print(summary_stats)
print(mean_prices)

