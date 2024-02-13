#1

# а) Матрица и транспорнирование
A <- matrix(c(1, 0, 0, 2, 0, 3, 1, 4, 2, 0, 3, 5), nrow = 3, ncol = 4, byrow = TRUE)
A_transposed <- t(A)

print("Исходная матрица A:")
print(A)
print("Транспонированная матрица A:")
print(A_transposed)

# б) Транспонирование вектора
B <- matrix(c(1, 3, 5, 1), ncol = 1)
B_transposed <- t(B)

print("Исходный вектор B:")
print(B)
print("Транспонированный вектор B:")
print(B_transposed)

#2

# Сложение матриц
A <- matrix(c(2, 3, 4, 7, 6, 5, 1, 8, 9), nrow = 3, byrow = TRUE)
B <- matrix(c(1, 3, -4, 7, -5, 5, 1, 8, 8), nrow = 3, byrow = TRUE)
result <- A + B

print("Результат сложения матриц A и B:")
print(result)

#3

# Вычисления с матрицами
A <- matrix(c(1, 0, 4, 3, 2, 1), nrow = 3, byrow = TRUE)
B <- matrix(c(1, -1, 2, 3, 1, 5), nrow = 3, byrow = TRUE)
C <- matrix(c(3, 4, 1, 3, 6, 8), nrow = 3, byrow = TRUE)
result <- 3 * A - 4 * B + C^2

print("Результат вычислений:")
print(result)

#4

# Размерность матриц при умножении
dim_A <- c(2, 4)
dim_B <- c(4, 5)
dim_C <- c(dim_A[1], dim_B[2])

print("Размерность матрицы C:")
print(dim_C)

#5

# Умножение матриц
A <- matrix(c(1, 0, 2, -3, 2, 0, 0, 0, 1), nrow = 3, byrow = TRUE)
B <- matrix(c(-1, 3, 1, 0, 1, 1, -2, 1, 3), nrow = 3, byrow = TRUE)
AB <- A %*% B
BA <- B %*% A

print("Результат умножения A на B:")
print(AB)
print("Результат умножения B на A:")
print(BA)

#6

# Возведение матрицы в степень
A <- matrix(c(1, 2, 3, -1), nrow = 2, byrow = TRUE)
A_squared <- A %*% A

print("Квадрат матрицы A:")
print(A_squared)

#7

# Применение функции
A <- matrix(c(4, -3, 9, 1), nrow = 2, byrow = TRUE)
f_A <- function(x) { x^2 - 2*x }
result <- f_A(A)

print("Результат применения функции f к матрице A:")
print(result)