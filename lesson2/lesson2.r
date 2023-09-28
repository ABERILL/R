# 1 Vectors
vector1 <- c("one", "two", "three")
vector2 <- sample(x = 1:5, size = 5, replace = FALSE)
print(vector1)
print(vector2)
# 2
print(length(vector2))
print(vector2[1])
print(vector2[2:4])
# 3
a <- c(1, 2, 3)
b <- c(4, 5, 6)
print(a + b)
# 4
print(mean(vector2))
# 5
func <- function(x) {
  result <- x / 2
  return(result)
}
# 6
print(func(vector2))

# 1 Matrix
matrix1 <- matrix(
  data = 1:9,
  nrow = 3, ncol = 3,
  dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3"))
)
print(matrix1)

matrix2 <- array(
  data = 1:9,
  dim = c(3, 3), 
  dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3"))
)
print(matrix2)
# 2
print(matrix1[, 1])
print(matrix1[2, ])
# 3
print(matrix1[2, 2])

# 1 DataFrame

df <- read.csv(file = "R/lesson2/ДЗ2_vgsales.csv", header = TRUE, sep = ",")
print(head(df, 3))
print(str(df))
print(summary(df))