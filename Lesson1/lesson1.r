a <- 5
b <- 3.4
c <- 'string'
print(round(a/b,2))
print(b<a)
cat(' ',c,',',c,',',c)
print('',quote = FALSE)
for (i in 2021:2023){
   cat("Маркентинговый проект запустился в",i,"году",end='\n')
}
for(i in 2021:2030){
    if (2021<=i && i<=2023)
        cat("Маркентинговый проект запустился в",i,"году",end='\n')
    else
       cat("Маркентинговый проект только запустится в",i,"году",end='\n')
}
tmp<-c(1432,TRUE)
print(tmp)