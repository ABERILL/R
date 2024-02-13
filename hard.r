library(ggplot2)

# Задаем порядковый номер и общее количество студентов в группе
k <- 19   # Мой номер
n <- 21  # Общее количество студентов в вашей группе

# 1. Биномиальное распределение
p_binomial <- k / n
n_binomial <- n

# Генерация данных
data_binomial <- rbinom(1000, size = n_binomial, prob = p_binomial)

# Расчет метрик
mean_binomial <- mean(data_binomial)
var_binomial <- var(data_binomial)
sd_binomial <- sd(data_binomial)
mode_binomial <- as.numeric(names(sort(table(data_binomial), decreasing = TRUE)[1]))
median_binomial <- median(data_binomial)

# Графики
ggplot(data.frame(x = data_binomial), aes(x)) +
  geom_histogram(aes(y = ..density..), binwidth = 1, fill = "lightblue", color = "black") +
  stat_function(fun = function(x) dbinom(x, size = n_binomial, prob = p_binomial), color = "red", linetype = "dashed") +
  ggtitle("Биномиальное распределение") +
  labs(x = "Значение", y = "Плотность") +
  theme_minimal()

# 2. Хи-квадрат распределение
df_chi <- (n - 1) + k

# Генерация данных
data_chi <- rchisq(1000, df = df_chi)

# Расчет метрик
mean_chi <- mean(data_chi)
var_chi <- var(data_chi)
sd_chi <- sd(data_chi)
mode_chi <- NA  # Хи-квадрат распределение не имеет четкой моды
median_chi <- median(data_chi)

# Графики
ggplot(data.frame(x = data_chi), aes(x)) +
  geom_histogram(aes(y = ..density..), binwidth = 1, fill = "lightgreen", color = "black") +
  stat_function(fun = function(x) dchisq(x, df = df_chi), color = "red", linetype = "dashed") +
  ggtitle("Хи-квадрат распределение") +
  labs(x = "Значение", y = "Плотность") +
  theme_minimal()

# 3. Нормальное распределение
m_normal <- k * 100
sigma_normal <- sqrt(n + k)

# Генерация данных
data_normal <- rnorm(1000, mean = m_normal, sd = sigma_normal)

# Расчет метрик
mean_normal <- mean(data_normal)
var_normal <- var(data_normal)
sd_normal <- sd(data_normal)
mode_normal <- NA  # Нормальное распределение не имеет четкой моды
median_normal <- median(data_normal)

# Графики
ggplot(data.frame(x = data_normal), aes(x)) +
  geom_histogram(aes(y = ..density..), binwidth = 10, fill = "lightcoral", color = "black") +
  stat_function(fun = function(x) dnorm(x, mean = m_normal, sd = sigma_normal), color = "red", linetype = "dashed") +
  ggtitle("Нормальное распределение") +
  labs(x = "Значение", y = "Плотность") +
  theme_minimal()

# Задача 2
#1
#a

n_total <- 60
m_firm <- 35
r_repair <- 5

# а) Вероятность ровно двух фирменных автомобилей в ремонте
prob_a <- (choose(m_firm, 2) * choose(n_total - m_firm, r_repair - 2)) / choose(n_total, r_repair)

# б) Вероятность хотя бы одного фирменного автомобиля в ремонте
prob_b <- 1 - choose(n_total - m_firm, r_repair) / choose(n_total, r_repair)

cat("а) Вероятность ровно двух фирменных автомобилей в ремонте:", prob_a, "\n")
cat("б) Вероятность хотя бы одного фирменного автомобиля в ремонте:", prob_b, "\n")



#2. 2 задача
# а) Вероятность совпадения с днем рождения хотя бы у одного из 390 однокурсников
prob_a <- 1 - (1 - 1/365)^390

# б) Находим, сколько человек нужно, чтобы вероятность совпадения была больше 0.5
n <- 1
while ((1 - (1 - 1/365)^n) <= 0.5) {
  n <- n + 1
}

cat("а) Вероятность совпадения хотя бы с одним из 390 однокурсников:", prob_a, "\n")
cat("б) Число человек, чтобы вероятность совпадения была больше 0.5:", n, "\n")


# Данные
n_total <- 52
k_hand <- 5

# Инициализация вероятности
probabilities <- numeric(9)

# Перечень комбинаций
combinations <- c("пара", "две пары", "тройка", "стрит", "флэш", "три+два", "каре", "стрит-флэш", "ройал-флэш")

# Цикл для вычисления вероятности каждой комбинации
for (i in 1:9) {
  switch(i,
         probabilities[i] <- (choose(13, 1) * choose(4, 2) * choose(12, 3) * choose(4, 1)) / choose(n_total, k_hand),  # пара
         probabilities[i] <- (choose(13, 2) * choose(4, 2) * choose(4, 2) * choose(11, 1) * choose(4, 1)) / choose(n_total, k_hand),  # две пары
         probabilities[i] <- (choose(13, 1) * choose(4, 3) * choose(12, 2) * choose(4, 1)) / choose(n_total, k_hand),  # тройка
         probabilities[i] <- (choose(10, 1) * 4^5) / choose(n_total, k_hand),  # стрит
         probabilities[i] <- (choose(4, 1) * choose(13, 5)) / choose(n_total, k_hand),  # флэш
         probabilities[i] <- (choose(13, 1) * choose(4, 3) * choose(12, 1) * choose(4, 2)) / choose(n_total, k_hand),  # три+два
         probabilities[i] <- (choose(13, 1) * choose(4, 4) * choose(12, 1) * choose(4, 1)) / choose(n_total, k_hand),  # каре
         probabilities[i] <- (choose(10, 1) * 4^5) / choose(n_total, k_hand),  # стрит-флэш
         probabilities[i] <- (choose(1, 1) * 4^5) / choose(n_total, k_hand)  # ройал-флэш
  )
}

# Вероятность того, что не выпадет ни одна из комбинаций
prob_no_combination <- 1 - sum(probabilities)

# Вывод результатов
for (i in 1:9) {
  cat(combinations[i], ":", probabilities[i], "\n")
}

cat("Вероятность того, что не выпадет ни одна из комбинаций:", prob_no_combination, "\n")